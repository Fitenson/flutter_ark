import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ark/src/navigation/router_observer.dart';

mixin ArkStatefulNavigation<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  String get path;

  @override
  void initState() {
    super.initState();
    _setActivePath();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget != widget) {
      _setActivePath();
    }
  }

  void _setActivePath() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(mounted) {
        ref.read(activePathProvider.notifier).state = path;
      }
    });
  }
}

mixin ArkStatelessNavigation on ConsumerWidget {
  String get path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(activePathProvider.notifier).state = path;
    });
    return buildWithNavigation(context, ref);
  }

  Widget buildWithNavigation(BuildContext context, WidgetRef ref);
}
