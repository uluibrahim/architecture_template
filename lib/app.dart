import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'product/constants/theme_constants.dart';
import 'product/global_provider.dart';
import 'product/models/app_model.dart';
import 'product/route/app_router.dart';
import 'product/theme/theme_dark.dart';
import 'product/theme/theme_ligth.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: ScreenUtilInit(
        designSize: const Size(
          ThemeConstants.referenceWidth,
          ThemeConstants.referenceHeight,
        ),
        builder: (_, __) {
          return Consumer<AppModel>(
            builder: (_, appData, __) {
              return MaterialApp.router(
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: _appRouter.config(),
                theme: themeDataLight,
                darkTheme: themeDataDark,
                themeMode: appData.themeMode,
                debugShowCheckedModeBanner: false,
                locale: appData.currentLanguage,
              );
            },
          );
        },
      ),
    );
  }
}
