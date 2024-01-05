import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../core/enum/app_state_enum.dart';
import '../../core/extensions/context_ext.dart';
import '../../core/view_model/view_model.dart';
import '../../product/enums/tab_enums.dart';
import '../../product/models/tab_model.dart';
import '../../screens/bottom_navigation/bottom_navigation_data.dart';
import '../home/home_view.dart';
import '../settings/settings_view.dart';

@injectable
class BottomNavigationViewModel extends ViewModel<BottomNavigationData> {
  BottomNavigationViewModel() : super(BottomNavigationData.initial());

  void createPages(BuildContext context) {
    final List<TabModel> tabs = [
      TabModel(
        title: context.locale.homePage,
        screen: const MyHomeScreen(),
        tabId: TabPages.home,
        tab: Tab(
          icon: const Icon(Icons.home),
          text: context.locale.homePage,
        ),
      ),
      TabModel(
        title: context.locale.settings,
        screen: const SettingsScreen(),
        tabId: TabPages.settings,
        tab: Tab(
          icon: const Icon(Icons.settings),
          text: context.locale.settings,
        ),
      ),
    ];

    updateState(tabs: tabs);
  }

  void changeCurrentIndex(int index) {
    updateState(currentIndex: index);
  }

  @override
  void updateState({
    AppState? state,
    int? currentIndex,
    List<TabModel>? tabs,
  }) {
    stateData = BottomNavigationData(
      appState: state ?? value.appState,
      currentIndex: currentIndex ?? value.currentIndex,
      tabs: tabs ?? value.tabs,
    );
  }
}
