import '../../core/model/state_data.dart';
import '../../product/models/tab_model.dart';

class BottomNavigationData extends StateData {
  final int currentIndex;
  final List<TabModel> tabs;

  const BottomNavigationData({
    required super.appState,
    required this.currentIndex,
    required this.tabs,
  });

  BottomNavigationData.initial()
      : currentIndex = 0,
        tabs = [];

  @override
  List<Object?> get props => [
        super.appState,
        currentIndex,
        tabs,
      ];
}
