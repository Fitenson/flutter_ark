import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

abstract class MouseAreaRegistry {
  void registerMouseArea(ArkMouseAreaRenderBox region);
  void unregisterMouseArea(ArkMouseAreaRenderBox region);

  static MouseAreaRegistry? maybeOf(BuildContext context) {
    return context.findAncestorRenderObjectOfType<MouseAreaSurfaceRenderBox>();
  }

  static MouseAreaRegistry of(BuildContext context) {
    final registry = maybeOf(context);
    assert(() {
      if (registry == null) {
        throw FlutterError(
          '''
MouseRegionRegistry.of() was called with a context that does not contain a MouseRegionSurface widget.\n
  No MouseRegionSurface widget ancestor could be found starting from the context that was passed to 
  MouseRegionRegistry.of().\n
  The context used was:\n
    $context
''',
        );
      }
      return true;
    }());
    return registry!;
  }
}

class MouseAreaSurfaceRenderBox extends RenderProxyBoxWithHitTestBehavior
    implements MouseAreaRegistry {
  final Expando<BoxHitTestResult> _cachedResults = Expando<BoxHitTestResult>();
  final Set<ArkMouseAreaRenderBox> _registeredRegions =
  <ArkMouseAreaRenderBox>{};
  final Map<Object?, Set<ArkMouseAreaRenderBox>> _groupIdToRegions =
  <Object?, Set<ArkMouseAreaRenderBox>>{};

  @override
  void handleEvent(PointerEvent event, HitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    assert(
        () {
      for (final region in _registeredRegions) {
        if (!region.enabled) {
          return false;
        }
      }
      return true;
    }(),
    'A MouseAreaRegion was registered when it was disabled.',
    );

    if (_registeredRegions.isEmpty) {
      return;
    }

    final result = _cachedResults[entry];

    if (result == null) {
      return;
    }

    final hitRegions = _getRegionsHit(
      _registeredRegions,
      result.path,
    ).cast<ArkMouseAreaRenderBox>().toSet();

    final insideRegions = <ArkMouseAreaRenderBox>{
      for (final ArkMouseAreaRenderBox region in hitRegions)
        if (region.groupId == null)
          region
        else
          ..._groupIdToRegions[region.groupId]!,
    };
    // If they're not inside, then they're outside.
    final outsideRegions = _registeredRegions.difference(insideRegions);
    for (final region in outsideRegions) {
      region.onExit?.call(
        PointerExitEvent(
          viewId: event.viewId,
          timeStamp: event.timeStamp,
          pointer: event.pointer,
          device: event.device,
          position: event.position,
          delta: event.delta,
          buttons: event.buttons,
          obscured: event.obscured,
          pressureMin: event.pressureMin,
          pressureMax: event.pressureMax,
          distance: event.distance,
          distanceMax: event.distanceMax,
          size: event.size,
          radiusMajor: event.radiusMajor,
          radiusMinor: event.radiusMinor,
          radiusMin: event.radiusMin,
          radiusMax: event.radiusMax,
          orientation: event.orientation,
          tilt: event.tilt,
          down: event.down,
          synthesized: event.synthesized,
          embedderId: event.embedderId,
        ),
      );
    }
    for (final region in insideRegions) {
      region.onEnter?.call(
        PointerEnterEvent(
          viewId: event.viewId,
          timeStamp: event.timeStamp,
          pointer: event.pointer,
          device: event.device,
          position: event.position,
          delta: event.delta,
          buttons: event.buttons,
          obscured: event.obscured,
          pressureMin: event.pressureMin,
          pressureMax: event.pressureMax,
          distance: event.distance,
          distanceMax: event.distanceMax,
          size: event.size,
          radiusMajor: event.radiusMajor,
          radiusMinor: event.radiusMinor,
          radiusMin: event.radiusMin,
          radiusMax: event.radiusMax,
          orientation: event.orientation,
          tilt: event.tilt,
          down: event.down,
          synthesized: event.synthesized,
          embedderId: event.embedderId,
        ),
      );
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (!size.contains(position)) {
      return false;
    }

    final hitTarget =
        hitTestChildren(result, position: position) || hitTestSelf(position);

    if (hitTarget) {
      final entry = BoxHitTestEntry(this, position);
      _cachedResults[entry] = result;
      result.add(entry);
    }

    return hitTarget;
  }

  @override
  void registerMouseArea(ArkMouseAreaRenderBox region) {
    assert(!_registeredRegions.contains(region));
    _registeredRegions.add(region);
    if (region.groupId != null) {
      _groupIdToRegions[region.groupId] ??= <ArkMouseAreaRenderBox>{};
      _groupIdToRegions[region.groupId]!.add(region);
    }
  }

  @override
  void unregisterMouseArea(ArkMouseAreaRenderBox region) {
    assert(_registeredRegions.contains(region));
    _registeredRegions.remove(region);
    if (region.groupId != null) {
      assert(_groupIdToRegions.containsKey(region.groupId));
      _groupIdToRegions[region.groupId]!.remove(region);
      if (_groupIdToRegions[region.groupId]!.isEmpty) {
        _groupIdToRegions.remove(region.groupId);
      }
    }
  }

  Set<HitTestTarget> _getRegionsHit(
      Set<ArkMouseAreaRenderBox> detectors,
      Iterable<HitTestEntry> hitTestPath,
      ) {
    return <HitTestTarget>{
      for (final HitTestEntry<HitTestTarget> entry in hitTestPath)
        if (entry.target case final HitTestTarget target)
          if (_registeredRegions.contains(target)) target,
    };
  }
}

class ArkMouseArea extends SingleChildRenderObjectWidget {
  const ArkMouseArea({
    super.key,
    super.child,
    this.enabled = true,
    this.behavior = HitTestBehavior.deferToChild,
    this.groupId,
    this.onEnter,
    this.onExit,
    this.cursor = MouseCursor.defer,
    String? debugLabel,
  }) : debugLabel = kReleaseMode ? null : debugLabel;

  final bool enabled;

  final HitTestBehavior behavior;

  final Object? groupId;

  final PointerEnterEventListener? onEnter;

  final PointerExitEventListener? onExit;

  final MouseCursor cursor;

  final String? debugLabel;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return ArkMouseAreaRenderBox(
      registry: MouseAreaRegistry.maybeOf(context),
      enabled: enabled,
      behavior: behavior,
      groupId: groupId,
      debugLabel: debugLabel,
      onEnter: onEnter,
      onExit: onExit,
      cursor: cursor,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        FlagProperty(
          'enabled',
          value: enabled,
          ifFalse: 'DISABLED',
          defaultValue: true,
        ),
      )
      ..add(
        DiagnosticsProperty<HitTestBehavior>(
          'behavior',
          behavior,
          defaultValue: HitTestBehavior.deferToChild,
        ),
      )
      ..add(
        DiagnosticsProperty<Object?>(
          'debugLabel',
          debugLabel,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Object?>('groupId', groupId, defaultValue: null),
      );
  }

  @override
  void updateRenderObject(
      BuildContext context,
      covariant ArkMouseAreaRenderBox renderObject,
      ) {
    renderObject
      ..registry = MouseAreaRegistry.maybeOf(context)
      ..enabled = enabled
      ..behavior = behavior
      ..groupId = groupId
      ..onEnter = onEnter
      ..onExit = onExit;
    if (!kReleaseMode) {
      renderObject.debugLabel = debugLabel;
    }
  }
}

class ArkMouseAreaRenderBox extends RenderProxyBoxWithHitTestBehavior {
  ArkMouseAreaRenderBox({
    this.onEnter,
    this.onExit,
    MouseAreaRegistry? registry,
    bool enabled = true,
    super.behavior = HitTestBehavior.deferToChild,
    bool validForMouseTracker = true,
    Object? groupId,
    String? debugLabel,
    MouseCursor cursor = MouseCursor.defer,
  }) : _registry = registry,
        _cursor = cursor,
        _validForMouseTracker = validForMouseTracker,
        _enabled = enabled,
        _groupId = groupId,
        debugLabel = kReleaseMode ? null : debugLabel;

  bool _isRegistered = false;

  String? debugLabel;

  bool _enabled;

  Object? _groupId;
  MouseAreaRegistry? _registry;
  bool _validForMouseTracker;

  MouseCursor _cursor;
  PointerEnterEventListener? onEnter;
  PointerExitEventListener? onExit;

  MouseCursor get cursor => _cursor;
  set cursor(MouseCursor value) {
    if (_cursor != value) {
      _cursor = value;
      markNeedsPaint();
    }
  }

  bool get enabled => _enabled;

  set enabled(bool value) {
    if (_enabled != value) {
      _enabled = value;
      markNeedsLayout();
    }
  }

  Object? get groupId => _groupId;

  set groupId(Object? value) {
    if (_groupId != value) {
      if (_isRegistered) {
        _registry!.unregisterMouseArea(this);
        _isRegistered = false;
      }
      _groupId = value;
      markNeedsLayout();
    }
  }

  MouseAreaRegistry? get registry => _registry;

  set registry(MouseAreaRegistry? value) {
    if (_registry != value) {
      if (_isRegistered) {
        _registry!.unregisterMouseArea(this);
        _isRegistered = false;
      }
      _registry = value;
      markNeedsLayout();
    }
  }

  bool get validForMouseTracker => _validForMouseTracker;

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _validForMouseTracker = true;
  }

  @override
  Size computeSizeForNoChild(BoxConstraints constraints) {
    return constraints.biggest;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<String?>(
          'debugLabel',
          debugLabel,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Object?>('groupId', groupId, defaultValue: null),
      )
      ..add(
        FlagProperty(
          'enabled',
          value: enabled,
          ifFalse: 'DISABLED',
          defaultValue: true,
        ),
      );
  }

  @override
  void detach() {
    _validForMouseTracker = false;
    super.detach();
  }

  @override
  void dispose() {
    if (_isRegistered) {
      _registry!.unregisterMouseArea(this);
    }
    super.dispose();
  }

  @override
  void layout(Constraints constraints, {bool parentUsesSize = false}) {
    super.layout(constraints, parentUsesSize: parentUsesSize);
    if (_registry == null) {
      return;
    }
    if (_isRegistered) {
      _registry!.unregisterMouseArea(this);
    }
    final shouldBeRegistered = _enabled && _registry != null;
    if (shouldBeRegistered) {
      _registry!.registerMouseArea(this);
    }
    _isRegistered = shouldBeRegistered;
  }
}

class ArkMouseAreaSurface extends SingleChildRenderObjectWidget {
  const ArkMouseAreaSurface({
    super.key,
    required Widget super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MouseAreaSurfaceRenderBox();
  }

  @override
  void updateRenderObject(
      BuildContext context,
      RenderProxyBoxWithHitTestBehavior renderObject,
      ) {}
}
