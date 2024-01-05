// Instantiate new  theme data
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/theme_constants.dart';

final ThemeData themeDataDark = _themeData();

ThemeData _themeData() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
        primary: ThemeConstants.colorSchemeDark.primary,
        onPrimary: ThemeConstants.colorSchemeDark.accent6,
        secondary: ThemeConstants.colorSchemeDark.secondary,
        onSecondary: ThemeConstants.colorSchemeDark.accent6,
        primaryContainer: ThemeConstants.colorSchemeDark.accent6),
    scaffoldBackgroundColor: ThemeConstants.colorSchemeDark.background,
    textTheme: _textTheme,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    ),
    tabBarTheme: _tabbarTheme,
  );
}

TextTheme get _textTheme => ThemeData.dark().textTheme.copyWith();

TabBarTheme get _tabbarTheme {
  return TabBarTheme(
    indicatorColor: ThemeConstants.colorSchemeDark.transparent,
    overlayColor:
        MaterialStatePropertyAll(ThemeConstants.colorSchemeDark.transparent),
    labelColor: ThemeConstants.colorSchemeDark.accent6,
    unselectedLabelColor: ThemeConstants.colorSchemeDark.accent7,
    labelStyle: _textTheme.bodyLarge!.copyWith(
      fontSize: 14.sp,
    ),
    unselectedLabelStyle: _textTheme.bodyLarge!.copyWith(
      fontSize: 14.sp,
    ),
  );
}
