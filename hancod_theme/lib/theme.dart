import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hancod_theme/hancod_theme.dart';

// This is to prevent transitions on web
class NoTransitionsOnWeb extends PageTransitionsTheme {
  const NoTransitionsOnWeb();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}

class AppTheme {
  AppTheme._();

  static const double textFieldBorderRadius = 8;
  static final lightTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Inter',
    colorSchemeSeed: AppColors.brandGold,
    scaffoldBackgroundColor: const Color(0xFFF2F2F2),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _inputBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.textfieldOutline),
      ),
      focusedBorder: _inputBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.brandGold),
      ),
      errorBorder: _inputBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.red),
      ),
      border: _inputBorder,
      fillColor: AppColors.textfieldFill,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: AppText.largeSB.copyWith(color: AppColors.black),
      elevation: 0,
    ),
    menuTheme: MenuThemeData(
      style: MenuStyle(
        surfaceTintColor: WidgetStateProperty.all(AppColors.white),
        backgroundColor: WidgetStateProperty.all(AppColors.white),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        alignment: Alignment.center,
      ),
    ),
    pageTransitionsTheme: const NoTransitionsOnWeb(),
    dialogTheme: const DialogThemeData(backgroundColor: AppColors.white),
  );
  static final darkTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Inter',
    colorSchemeSeed: AppColors.primaryColor,
  );
  static const _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
  );

  static Brightness get currentSystemBrightness =>
      PlatformDispatcher.instance.platformBrightness;

  static void setStatusBarAndNavigationBarColors() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
  }
}
