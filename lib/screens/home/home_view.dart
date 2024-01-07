import 'package:architecture_template/product/init/config/app_environment.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/enum/app_state_enum.dart';
import '../../core/extensions/context_ext.dart';
import '../../core/screen/screen.dart';
import 'home_data.dart';
import 'home_view_model.dart';

part 'home_view_mixin.dart';

@RoutePage()
class MyHomeScreen extends Screen {
  const MyHomeScreen({super.key});

  @override
  MyHomeScreenState createState() => MyHomeScreenState();
}

class MyHomeScreenState
    extends ScreenState<MyHomeScreen, HomeViewModel, HomeData>
    with HomeViewMixin {
  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            descripton,
            titleSelector,
            goToTemplateButton,
            goToSettingsButton,
          ],
        ),
      ),
      floatingActionButton: incementButton,
    );
  }
}
