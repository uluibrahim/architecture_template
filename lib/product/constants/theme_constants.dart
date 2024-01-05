import 'package:flutter/material.dart';

class ThemeConstants {
  //Design Reference
  static const double referenceWidth = 375.0;
  static const double referenceHeight = 812.0;

  static CustomColorScheme colorSchemeLight = CustomColorScheme(
    primary: const Color.fromRGBO(0, 205, 207, 1),
    secondary: const Color.fromRGBO(120, 83, 255, 1),
    accent1: const Color.fromRGBO(34, 31, 72, 1),
    accent2: const Color.fromRGBO(254, 178, 32, 1),
    accent3: const Color.fromRGBO(246, 90, 90, 1),
    accent4: const Color.fromRGBO(0, 199, 149, 1),
    accent5: const Color.fromRGBO(35, 181, 255, 1),
    accent6: const Color.fromRGBO(255, 255, 255, 1),
    accent7: const Color.fromRGBO(100, 116, 139, 1),
    accent8: Colors.white,
    background: const Color.fromRGBO(249, 249, 255, 1),
  );

  static CustomColorScheme colorSchemeDark = CustomColorScheme(
    primary: const Color.fromRGBO(0, 205, 207, 1),
    secondary: const Color.fromRGBO(120, 83, 255, 1),
    accent1: const Color.fromRGBO(255, 255, 255, 1),
    accent2: const Color.fromRGBO(254, 178, 32, 1),
    accent3: const Color.fromRGBO(246, 90, 90, 1),
    accent4: const Color.fromRGBO(0, 199, 149, 1),
    accent5: const Color.fromRGBO(35, 181, 255, 1),
    accent6: const Color.fromRGBO(43, 43, 68, 1),
    accent7: const Color.fromRGBO(100, 116, 139, 1),
    accent8: Colors.white,
    background: const Color.fromRGBO(33, 33, 55, 1),
  );

  static String fontFamily = 'Roboto';

  static CustomColorScheme themeColorScheme(ThemeMode themeMode) =>
      themeMode == ThemeMode.dark ? colorSchemeDark : colorSchemeLight;
}

class CustomColorScheme {
  final Color primary;
  final Color secondary;
  final Color accent1;
  final Color accent2;
  final Color accent3;
  final Color accent4;
  final Color accent5;
  final Color accent6;
  final Color accent7;
  final Color accent8;
  final Color background;
  final Color transparent;

  CustomColorScheme({
    required this.primary,
    required this.secondary,
    required this.accent1,
    required this.accent2,
    required this.accent3,
    required this.accent4,
    required this.accent5,
    required this.accent6,
    required this.accent7,
    required this.accent8,
    required this.background,
    this.transparent = Colors.transparent,
  });
}
