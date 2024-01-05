import 'package:equatable/equatable.dart';

import '../enum/app_state_enum.dart';

abstract class StateData extends Equatable {
  final AppState appState;
  const StateData({this.appState = AppState.idle});
}
