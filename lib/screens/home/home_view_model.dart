import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../core/enum/app_state_enum.dart';
import '../../core/view_model/view_model.dart';
import '../../product/route/app_router.dart';
import 'home_data.dart';

@injectable
class HomeViewModel extends ViewModel<HomeData> {
  HomeViewModel() : super(const HomeData.initial());

  Future<void> incrementCounter() async {
    updateState(state: AppState.busy);
    await Future.delayed(const Duration(seconds: 1));
    updateState(state: AppState.idle, counter: value.counter + 1);
  }

  Future<void> decreaseCounter() async {
    updateState(state: AppState.busy);
    await Future.delayed(const Duration(seconds: 1));
    updateState(state: AppState.idle, counter: value.counter - 1);
  }

  void goToTemplateScreen(BuildContext context) {
    context.router.push(const TemplateRoute());
  }

  void goToSettingsScreen(BuildContext context) {
    context.router.push(const SettingsRoute());
  }

  void init() {}

  @override
  void updateState({
    int? counter,
    AppState? state,
  }) {
    stateData = HomeData(
      counter: counter ?? value.counter,
      appState: state ?? value.appState,
    );
  }
}
