import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ark/src/ui/sonner/sonner.dart';
import 'package:flutter_ark/src/ui/toast/toast.dart';
import 'package:flutter_ark/flutter_ark.dart';
import 'package:flutter_ark/src/theme/text_theme/theme.dart';

enum ArkAppType {
  ark,
  custom
}

final class ArkApp extends StatefulWidget {
  final ArkAppType type;
  final ArkThemeData? theme;
  final ArkThemeData? darkTheme;
  final ThemeMode? themeMode;
  final GlobalKey<NavigatorState>? navigatorKey;

  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;

  final RouteFactory? onUnknownRoute;
  final NotificationListenerCallback<NavigationNotification>? onNavigationNotification;
  final List<NavigatorObserver>? navigatorObservers;
  final RouterDelegate<Object>? routerDelegate;
  final TransitionBuilder? builder;

  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final ScrollBehavior scrollBehavior;
  final Curve themeCurve;
  final WidgetBuilder? appBuilder;
  final Color? backgroundColor;

  final BackButtonDispatcher? backButtonDispatcher;
  final RouterConfig? routerConfig;
  final PageRouteFactory? pageRouteFactory;
  final ThemeData Function(BuildContext context, ThemeData theme)? materialThemeBuilder;
  final bool showPerformanceOverlay;
  final Map<Type, Action<Intent>>? actions;

  const ArkApp({
    super.key,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.navigatorKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.onNavigationNotification,
    this.navigatorObservers,
    this.builder,
    required this.title,
    this.color,
    required this.scrollBehavior,
    required this.themeCurve,
    this.backgroundColor,
    this.pageRouteFactory,
    this.materialThemeBuilder,
    required this.showPerformanceOverlay,
    this.actions
  }) : type = ArkAppType.ark,
  appBuilder = null,
  onGenerateTitle = null,
  routerConfig = null,
  backButtonDispatcher = null,
  routerDelegate = null;

  @override
  State<StatefulWidget> createState() => _ArkAppState();
}

class _ArkAppState extends State<ArkApp> {
  final heroController = HeroController();

  bool get usesRouter => widget.routerDelegate != null || widget.routerConfig != null;

  @override
  void dispose() {
    super.dispose();
    heroController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: widget.scrollBehavior,
        child: HeroControllerScope(
            controller: heroController,
            child: ArkAnimatedTheme(
                data: theme(context),
                curve: widget.themeCurve,
                child: ArkMouseAreaSurface(
                    child: ArkMouseCursorProvider(
                        child: Builder(builder: _buildApp)
                    )
                )
            )
        )
    );
  }

  ArkThemeData get effectiveLightTheme => widget.theme ?? ArkThemeData(
    colorScheme: const ArkSlateColorScheme.light(),
    brightness: Brightness.light
  );

  ArkThemeData? get effectiveDarkTheme => widget.darkTheme;

  ArkThemeData theme(BuildContext context) {
    final mode = widget.themeMode ?? ThemeMode.system;
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final useDarkStyle = mode == ThemeMode.dark || (mode == ThemeMode.system && platformBrightness == Brightness.dark);
    final data = () {
      late ArkThemeData result;
      final lightTheme = effectiveLightTheme;
      if(useDarkStyle) {
        result = effectiveDarkTheme ?? lightTheme;
      } else {
        result = lightTheme;
      }
      return result;
    }();
    return data;
  }

  ThemeData materialTheme(BuildContext context) {
    final themeData = theme(context);
    var mTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: themeData.brightness,
          primary: themeData.colorScheme.primary,
          onPrimary: themeData.colorScheme.primaryForeground,
          secondary: themeData.colorScheme.secondary,
          onSecondary: themeData.colorScheme.secondaryForeground,
          error: themeData.colorScheme.destructive,
          onError: themeData.colorScheme.destructiveForeground,
          surface: themeData.colorScheme.background,
          onSurface: themeData.colorScheme.foreground
      ),
      scaffoldBackgroundColor: themeData.colorScheme.background,
      brightness: themeData.brightness,
      dividerTheme: DividerThemeData(
        color: themeData.colorScheme.border,
        thickness: 1,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: themeData.colorScheme.primary,
        selectionColor: themeData.colorScheme.selection,
        selectionHandleColor: themeData.colorScheme.primary
      ),
      iconTheme: IconThemeData(
        size: 16,
        color: themeData.colorScheme.foreground
      ),
      scrollbarTheme: ScrollbarThemeData(
        crossAxisMargin: 1,
        mainAxisMargin: 1,
        thickness: const WidgetStatePropertyAll(8),
        radius: const Radius.circular(999),
        thumbColor: WidgetStatePropertyAll(themeData.colorScheme.border)
      ),
    );

    mTheme = mTheme.copyWith(
      textTheme: applyGoogleFontToTextTheme(
          mTheme.textTheme,
      )
    );

    if(widget.materialThemeBuilder == null) return mTheme;
    return widget.materialThemeBuilder!(context, mTheme);
  }

  Widget _builder(BuildContext context, Widget? child) {
    return ArkAppBuilder(
      backgroundColor: widget.backgroundColor,
      builder: widget.builder,
      child: child,
    );
  }

  Widget _buildApp(BuildContext context) {
    final mTheme = materialTheme(context);
    final theme = ArkTheme.of(context);
    switch(widget.type) {
      case ArkAppType.ark:
        if(usesRouter) {
          return AnimatedTheme(
              data: mTheme,
              child: WidgetsApp.router(
                  key: GlobalObjectKey(this),
                  color: widget.color ?? Colors.blue,
                  routerDelegate: widget.routerDelegate,
                  routerConfig: (widget.routerConfig as RouterConfig<Object>?),
                  backButtonDispatcher: widget.backButtonDispatcher,
                  onNavigationNotification: widget.onNavigationNotification,
                  builder: _builder,
                  title: widget.title,
                  onGenerateTitle: widget.onGenerateTitle,
                  showPerformanceOverlay: widget.showPerformanceOverlay,
                  debugShowCheckedModeBanner: false,
                  actions: widget.actions,
                  textStyle: TextStyle(color: theme.colorScheme.foreground),
              )
          );
        }

        return AnimatedTheme(
            data: mTheme,
          child: WidgetsApp(
            key: GlobalObjectKey(this),
            navigatorKey: widget.navigatorKey,
            navigatorObservers: widget.navigatorObservers!,
            home: widget.home,
            routes: widget.routes!,
            initialRoute: widget.initialRoute,
            onGenerateRoute: widget.onGenerateRoute,
            onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
            onUnknownRoute: widget.onUnknownRoute,
            onNavigationNotification: widget.onNavigationNotification,
            builder: _builder,
            title: widget.title,
            onGenerateTitle: widget.onGenerateTitle,
            color: widget.color ?? Colors.blue,
            showPerformanceOverlay: widget.showPerformanceOverlay,
            debugShowCheckedModeBanner: false,
            actions: widget.actions,
            textStyle: TextStyle(color: theme.colorScheme.foreground),
            pageRouteBuilder:
            widget.pageRouteFactory ??
                <T>(RouteSettings settings, WidgetBuilder builder) {
                  return MaterialPageRoute<T>(
                    settings: settings,
                    builder: builder,
                  );
                },
          ),
        );

      case ArkAppType.custom:
        return AnimatedTheme(
          data: mTheme,
          child: Builder(
            builder: (BuildContext context) {
              return widget.appBuilder!(context);
            },
          ),
        );
    }
  }

  TextTheme applyGoogleFontToTextTheme(
      TextTheme textTheme, {
        GoogleFontBuilder? googleFontBuilder,
      }) {
    if (googleFontBuilder == null) return textTheme;
    return TextTheme(
      displayLarge: GoogleFontTextStyle(
        (textTheme.displayLarge ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      displayMedium: GoogleFontTextStyle(
        (textTheme.displayMedium ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      displaySmall: GoogleFontTextStyle(
        (textTheme.displaySmall ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      headlineLarge: GoogleFontTextStyle(
        (textTheme.headlineLarge ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      headlineMedium: GoogleFontTextStyle(
        (textTheme.headlineMedium ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      headlineSmall: GoogleFontTextStyle(
        (textTheme.headlineSmall ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      titleLarge: GoogleFontTextStyle(
        (textTheme.titleLarge ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      titleMedium: GoogleFontTextStyle(
        (textTheme.titleMedium ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      titleSmall: GoogleFontTextStyle(
        (textTheme.titleSmall ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      bodyLarge: GoogleFontTextStyle(
        (textTheme.bodyLarge ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      bodyMedium: GoogleFontTextStyle(
        (textTheme.bodyMedium ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      bodySmall: GoogleFontTextStyle(
        (textTheme.bodySmall ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      labelLarge: GoogleFontTextStyle(
        (textTheme.labelLarge ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      labelMedium: GoogleFontTextStyle(
        (textTheme.labelMedium ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
      labelSmall: GoogleFontTextStyle(
        (textTheme.labelSmall ?? const TextStyle()).omitFamilyAndPackage,
        builder: googleFontBuilder,
        overrideFamilyWithBuilder: true,
      ),
    );
  }
}


final class ArkAppBuilder extends StatelessWidget {
  const ArkAppBuilder({
    super.key,
    this.builder,
    this.child,
    this.backgroundColor,
  });

  final TransitionBuilder? builder;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context) {
          final effectiveChild = child != null ? 
              ArkToaster(child: ArkSonner(child: child!)) : child;

          return ColoredBox(
              color: backgroundColor ?? ArkTheme.of(context).colorScheme.background,
              child: builder?.call(context, effectiveChild) ?? effectiveChild,
          );
        }
    );
  }
}


class ArkScrollBehaviour extends ScrollBehavior {
  const ArkScrollBehaviour();
  
  @override
  Widget buildScrollbar(
      BuildContext context,
      Widget child,
      ScrollableDetails details
  ) {
    switch(axisDirectionToAxis(details.direction)) {
      case Axis.horizontal:
        return child;
      case Axis.vertical:
        switch(getPlatform(context)) {
          case TargetPlatform.macOS:
          case TargetPlatform.iOS:
            return CupertinoScrollbar(child: child, controller: details.controller);
          case TargetPlatform.linux:
          case TargetPlatform.windows:
            return Scrollbar(child: child, controller: details.controller);
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
            return child;
        }
    }
  }
}