import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/screen/screen.dart';
import '../../product/enums/tab_enums.dart';
import 'bottom_navigation_data.dart';
import 'bottom_navigation_view_model.dart';

part 'bottom_navigation_view_mixin.dart';

@RoutePage()
class BottomNavigationScreen extends Screen {
  const BottomNavigationScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends ScreenState<BottomNavigationScreen,
        BottomNavigationViewModel, BottomNavigationData>
    with SingleTickerProviderStateMixin, BottomNavigationViewMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TabPages.values.length, vsync: this);
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Consumer<BottomNavigationData>(
      builder: (_, data, __) {
        return Scaffold(
          bottomNavigationBar: bottomBar(data),
          body: tabBarView(data.tabs.map((e) => e.screen).toList()),
        );
      },
    );
  }
}
