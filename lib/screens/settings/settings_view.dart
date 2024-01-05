import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/components/mixin/empty_box.dart';
import '../../core/extensions/context_ext.dart';
import '../../core/screen/screen.dart';
import '../../product/models/app_model.dart';
import '../../product/providers/app_provider.dart';
import '../../screens/settings/settings_data.dart';
import '../../screens/settings/settings_view_model.dart';

part 'settings_view_mixin.dart';

@RoutePage()
class SettingsScreen extends Screen {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState
    extends ScreenState<SettingsScreen, SettingsViewModel, SettingsData>
    with SettingsViewMixin {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          themeSwitch,
          languagePopUp,
        ],
      ),
    );
  }
}
