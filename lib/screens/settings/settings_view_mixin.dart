part of 'settings_view.dart';

mixin SettingsViewMixin
    on ScreenState<SettingsScreen, SettingsViewModel, SettingsData> {
  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  bool get wantKeepAlive => true;

  AppBar get appbar => AppBar(
        title: Text(context.locale.title),
      );

  // CHANGE THEME
  Selector<SettingsData, bool> get themeSwitch => Selector<SettingsData, bool>(
        selector: (_, p1) => p1.isDarkMode,
        builder: (_, isDark, __) {
          return Switch(
            value: isDark,
            onChanged: (value) async {
              await viewModel.changeThemeMode();
            },
          );
        },
      );

  // CHANGE LANGUAGE
  Selector<AppModel, Locale> get languagePopUp {
    return Selector(
      builder: (_, locale, __) {
        return PopupMenuButton<Languages>(
          position: PopupMenuPosition.under,
          icon: const Icon(Icons.language),
          clipBehavior: Clip.hardEdge,
          onSelected: (value) async {
            await viewModel.changeLanguage(value);
          },
          itemBuilder: (_) {
            return Languages.values
                .map(
                  (e) => PopupMenuItem<Languages>(
                    value: e,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        e.name == locale.languageCode
                            ? Icon(
                                Icons.check,
                                color: context.customColors.primary,
                              )
                            : EmptyBoxes.emptyBox20Horz,
                        EmptyBoxes.emptyBox20Horz,
                        Text(
                          e.title,
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: e.name == locale.languageCode
                                  ? context.customColors.primary
                                  : null),
                        ),
                      ],
                    ),
                  ),
                )
                .toList();
          },
        );
      },
      selector: (_, p1) => p1.currentLanguage ?? Locale(Languages.en.name),
    );
  }
}
