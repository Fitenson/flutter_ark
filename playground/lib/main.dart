import 'package:flutter/material.dart';
import 'package:flutter_ark/flutter_ark.dart';
import 'package:playground/router.dart';
import 'package:playground/src/app/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ArkApp.custom(
        themeMode: ThemeMode.dark,
        darkTheme: ArkThemeData(
          brightness: Brightness.dark,
          colorScheme: const ArkSlateColorScheme.dark()
        ),
        appBuilder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Theme.of(context),
            builder: (context, child) {
              return ArkAppBuilder(child: const App());
            },
          );
        }
    );
  }
}
