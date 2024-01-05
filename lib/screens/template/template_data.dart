import '../../core/model/state_data.dart';

class TemplateData extends StateData {
  final bool inputEnabled;

  const TemplateData({
    super.appState,
    required this.inputEnabled,
  });

  const TemplateData.initial() : inputEnabled = true;

  @override
  List<Object?> get props => [
        super.appState,
        inputEnabled,
      ];
}
