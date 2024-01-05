import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../core/enum/app_state_enum.dart';
import '../../core/view_model/view_model.dart';
import '../../product/providers/app_provider.dart';
import 'settings_data.dart';

@injectable
class SettingsViewModel extends ViewModel<SettingsData> {
  final IAppProvider _appProvider;

  SettingsViewModel(
    this._appProvider,
  ) : super(const SettingsData.initial());

  void init() {
    _setSwitchValue();
  }

  void _setSwitchValue() {
    updateState(isDarkMode: _appProvider.value?.themeMode == ThemeMode.dark);
  }

  Future<void> changeThemeMode() async {
    await _appProvider.changeTheme();
    _setSwitchValue();
  }

  Future changeLanguage(Languages languages) async {
    await _appProvider.changeLanguage(languages);
  }

  @override
  void updateState({
    AppState? state,
    bool? isDarkMode,
  }) {
    stateData = SettingsData(
      appState: state ?? value.appState,
      isDarkMode: isDarkMode ?? value.isDarkMode,
    );
  }
}
