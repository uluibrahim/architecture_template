import '../../core/model/state_data.dart';

class SettingsData extends StateData {
  final bool isDarkMode;
  const SettingsData({
    required super.appState,
    required this.isDarkMode,
  });
  const SettingsData.initial() : isDarkMode = false;
  @override
  List<Object?> get props => [
        super.appState,
        isDarkMode,
      ];
}
