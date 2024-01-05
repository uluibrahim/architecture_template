import 'package:injectable/injectable.dart';

import '../../core/enum/app_state_enum.dart';
import '../../core/view_model/view_model.dart';
import 'template_data.dart';

@injectable
class TemplateViewModel extends ViewModel<TemplateData> {
  TemplateViewModel() : super(const TemplateData.initial());

  @override
  void updateState({
    bool isCreating = false,
    AppState? state,
  }) {
    stateData = TemplateData(
      appState: state ?? value.appState,
      inputEnabled: !isCreating,
    );
  }
}
