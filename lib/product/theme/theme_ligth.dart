// Instantiate new  theme data
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/theme_constants.dart';

final ThemeData themeDataLight = _themeData();

//Define Base theme for app
ThemeData _themeData() {
// We'll just overwrite whatever's already there using ThemeData.light()
  final ThemeData base = ThemeData.light();

  // Make changes to light() theme
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: ThemeConstants.colorSchemeLight.primary,
      onPrimary: ThemeConstants.colorSchemeLight.accent6,
      secondary: ThemeConstants.colorSchemeLight.secondary,
      onSecondary: ThemeConstants.colorSchemeLight.accent6,
      primaryContainer: ThemeConstants.colorSchemeLight.accent6,
    ),
    scaffoldBackgroundColor: ThemeConstants.colorSchemeLight.background,
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

TabBarTheme get _tabbarTheme {
  return TabBarTheme(
    indicatorColor: Colors.transparent,
    overlayColor:
        MaterialStatePropertyAll(ThemeConstants.colorSchemeLight.transparent),
    labelColor: ThemeConstants.colorSchemeLight.primary,
    unselectedLabelColor: Colors.grey,
    labelStyle: _textTheme.bodyLarge!.copyWith(
      fontSize: 14.sp,
    ),
    unselectedLabelStyle: _textTheme.bodyLarge!.copyWith(
      fontSize: 14.sp,
    ),
  );
}

TextTheme get _textTheme => ThemeData.light().textTheme.copyWith();
