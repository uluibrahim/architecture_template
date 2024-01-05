import '../../core/model/state_data.dart';

class HomeData extends StateData {
  final int counter;
  const HomeData({
    required this.counter,
    required super.appState,
  });

  const HomeData.initial() : counter = 0;

  @override
  List<Object?> get props => [
        counter,
        super.appState,
      ];
}
