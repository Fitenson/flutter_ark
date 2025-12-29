import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/utils/provider.dart';

class ArkMouseCursorController extends ChangeNotifier {
  ArkMouseCursorController({MouseCursor cursor = MouseCursor.defer})
      : _cursor = cursor;

  late MouseCursor _cursor;

  MouseCursor get cursor => _cursor;

  set cursor(MouseCursor cursor) {
    if (cursor == _cursor) return;
    _cursor = cursor;
    notifyListeners();
  }
}

class ArkMouseCursorProvider extends StatefulWidget {
  const ArkMouseCursorProvider({
    super.key,
    this.controller,
    required this.child,
  });

  final Widget child;
  final ArkMouseCursorController? controller;

  @override
  State<ArkMouseCursorProvider> createState() =>
      ArkMouseCursorProviderState();
}

class ArkMouseCursorProviderState extends State<ArkMouseCursorProvider> {
  ArkMouseCursorController? _internalController;

  ArkMouseCursorController get controller {
    if (widget.controller != null) return widget.controller!;
    return _internalController ??= ArkMouseCursorController();
  }

  @override
  void dispose() {
    _internalController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ArkProvider(
      data: controller,
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return MouseRegion(
            cursor: controller.cursor,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
