import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../inject/dependency_injection.dart';
import '../../product/constants/theme_constants.dart';
import '../../product/providers/app_provider.dart';

extension ContextExtension on BuildContext {
  Size get size => MediaQuery.sizeOf(this);
}

extension KeyboardExtension on BuildContext {
  bool get isKeyBoardOpen => MediaQuery.viewInsetsOf(this).bottom > 0;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  CustomColorScheme get customColors => ThemeConstants.themeColorScheme(
      getIt.get<IAppProvider>().value?.themeMode ?? ThemeMode.light);
}

extension LocaleExtension on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
}
