import 'package:flutter/widgets.dart';

final class ArkAnimationBuilder extends StatefulWidget {
  const ArkAnimationBuilder({
    super.key,
    required this.duration,
    required this.builder,
  });

  final Duration duration;
  final Widget Function(BuildContext context, AnimationController controller)
  builder;

  @override
  State<ArkAnimationBuilder> createState() => _ArkAnimationBuilderState();
}

class _ArkAnimationBuilderState extends State<ArkAnimationBuilder>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return widget.builder(context, controller);
      },
    );
  }
}