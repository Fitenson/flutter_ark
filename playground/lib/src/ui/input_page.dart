import 'package:flutter/material.dart';
import 'package:flutter_ark/flutter_ark.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum InputStyle {
  email,
  password
}

class InputPage extends ConsumerWidget {
  const InputPage({
    super.key,
    required this.style
  });

  final InputStyle style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      body: Center(
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: switch(style) {
              InputStyle.email => const EmailInput(),
              InputStyle.password => const PasswordInput()
            },
        ),
      ),
    );
  }
}

class EmailInput extends ConsumerWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ArkInput(
      placeholder: Text('Email'),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class PasswordInput extends ConsumerStatefulWidget {
  const PasswordInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordInputState();
}

class _PasswordInputState extends ConsumerState<PasswordInput> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ArkInput(
      placeholder: const Text('Password'),
      obscureText: obscure,
      leading: Icon(LucideIcons.lock),
      trailing: SizedBox.square(
        dimension: 24,
        child: OverflowBox(
          maxHeight: 28,
          maxWidth: 28,
          child: ArkIconButton(
            iconSize: 20,
            padding: EdgeInsets.all(2),
            icon: Icon(obscure ? LucideIcons.eyeOff : LucideIcons.eye),
            onPressed: () {
              setState(() {
                () => obscure = !obscure;
              });
            },
          ),
        ),
      ),
    );
  }
}
