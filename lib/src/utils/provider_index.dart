import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/utils/provider.dart';

@immutable
final class ArkProviderIndex {
  const ArkProviderIndex(this.index);

  final int index;
}

class ArkIndexProvider extends StatelessWidget {
  const ArkIndexProvider({
    super.key,
    required this.index,
    required this.child,
  });

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ArkProvider(
      data: ArkProviderIndex(index),
      notifyUpdate: (oldWidget) => oldWidget.data.index != index,
      child: child,
    );
  }
}
