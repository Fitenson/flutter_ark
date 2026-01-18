import 'package:flutter/material.dart';
import 'package:flutter_ark/flutter_ark.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/router.dart';
import 'package:playground/src/app/app.dart';
import 'package:playground/src/docs/docs_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = AppRouter();

    return ArkApp.custom(
        themeMode: ThemeMode.dark,
        darkTheme: ArkThemeData(
          brightness: Brightness.dark,
          colorScheme: const ArkSlateColorScheme.dark()
        ),
        appBuilder: (context) {
          return MaterialApp.router(
            routerConfig: router.router,
            debugShowCheckedModeBanner: false,
            theme: Theme.of(context),
            builder: (context, child) {
              return ArkAppBuilder(child: child!);
            },
          );
        }
    );
  }
}
