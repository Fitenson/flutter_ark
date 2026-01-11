import 'package:flutter/material.dart';
import 'package:flutter_ark/flutter_ark.dart';
import 'package:playground/src/app/desktop/navbar.desktop.dart';

final class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DesktopNavbar(),
      body: Stack(
        children: [
        ],
      ),
    );
  }
}
