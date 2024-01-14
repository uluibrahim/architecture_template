import 'package:injectable/injectable.dart';

import '../../core/enum/app_state_enum.dart';
import '../../core/view_model/view_model.dart';
import '../../product/models/auth/login_request.dart';
import '../../product/models/auth/login_response.dart';
import '../../product/repositories/auth_repository.dart';
import 'login_data.dart';

@injectable
class LoginViewModel extends ViewModel<LoginData> {
  final IAuthRepository _authRepository;
  LoginViewModel(this._authRepository) : super(const LoginData.initial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    updateState(state: AppState.busy, isCreating: true);
    final request = LoginRequest(username: username, password: password);
    LoginResponse loginResponse = await _authRepository.login(request);
    updateState(state: AppState.idle, loginResponse: loginResponse);
  }

  @override
  void updateState({
    bool isCreating = false,
    AppState? state,
    LoginResponse? loginResponse,
  }) {
    stateData = LoginData(
      appState: state ?? value.appState,
      inputEnabled: !isCreating,
      loginResponse: loginResponse ?? value.loginResponse,
    );
  }
}
