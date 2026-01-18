import 'package:flutter/material.dart';
import 'package:flutter_ark/flutter_ark.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/router.dart';
import 'package:playground/src/app/desktop/navbar.desktop.dart';

final class App extends ConsumerStatefulWidget {
  const App({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DesktopNavbar(),
      body: Container(
        child: Center(child: Text('App')),
      ),
    );
  }
}
