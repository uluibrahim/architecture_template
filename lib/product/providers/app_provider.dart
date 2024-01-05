import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../models/app_model.dart';
import '../services/shared_preferences_service.dart';

// The new language option must be the last element.
// No new option must be added between the two options.

enum Languages {
  en('English'),
  tr('Türkçe');

  final String title;
  const Languages(this.title);
}

abstract class IAppProvider implements ValueListenable<AppModel?> {
  Future<void> changeLanguage(Languages locale);
  Future<void> changeTheme();
  void init();
}

@Singleton(as: IAppProvider)
class AppProvider implements IAppProvider {
  final ISharedPreferencesService _sharedPreferencesService;
  AppProvider(this._sharedPreferencesService)
      : _stateDataNotifier = ValueNotifier(const AppModel());

  final ValueNotifier<AppModel?> _stateDataNotifier;

  @override
  void init() {
    _stateDataNotifier.value = AppModel(
      themeMode: _getCurrentTheme,
      currentLanguage: _getCurrentLanguage,
    );
  }

  @override
  AppModel? get value => _stateDataNotifier.value;

  @override
  Future<void> changeTheme() async {
    _stateDataNotifier.value = AppModel(
      currentLanguage: _stateDataNotifier.value?.currentLanguage,
      themeMode: _stateDataNotifier.value?.themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light,
    );

    await _sharedPreferencesService
        .setThemeMode(_stateDataNotifier.value?.themeMode?.index ?? 1);
  }

  ThemeMode get _getCurrentTheme {
    final int? themeValue = _sharedPreferencesService.getThemeMode();

    return (themeValue == 1 || themeValue == null)
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  Locale get _getCurrentLanguage {
    int? languageValue = _sharedPreferencesService.getLanguage();
    languageValue ??= _locale(Platform.localeName.substring(0, 2));
    return getLocale(languageValue);
  }

  int? _locale(String locale) {
    switch (locale) {
      case 'tr':
        return 1;
      default:
        return 0;
    }
  }

  @override
  Future<void> changeLanguage(Languages value) async {
    _stateDataNotifier.value = AppModel(
      currentLanguage: getLocale(value.index),
      themeMode: _stateDataNotifier.value?.themeMode,
    );

    await _sharedPreferencesService.setLanguage(value.index);
  }

  @override
  void addListener(VoidCallback listener) {
    _stateDataNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _stateDataNotifier.removeListener(listener);
  }

  @mustCallSuper
  void dispose() {
    _stateDataNotifier.dispose();
  }
}

Locale getLocale(int? index) {
  if (index == 1) {
    return const Locale.fromSubtags(
        languageCode: 'tr', countryCode: 'TR', scriptCode: 'Türkçe');
  } else {
    return const Locale.fromSubtags(
        languageCode: 'en', countryCode: 'US', scriptCode: 'English');
  }
}
