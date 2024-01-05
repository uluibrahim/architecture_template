import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppModel extends Equatable {
  final Locale? currentLanguage;
  final ThemeMode? themeMode;

  const AppModel({
    this.currentLanguage,
    this.themeMode,
  });

  @override
  List<Object?> get props => [
        currentLanguage,
        themeMode,
      ];
}
