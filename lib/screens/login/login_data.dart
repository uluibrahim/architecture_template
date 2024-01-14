import '../../core/model/state_data.dart';
import '../../product/models/auth/login_response.dart';

class LoginData extends StateData {
  final bool inputEnabled;
  final LoginResponse? loginResponse;

  const LoginData({
    super.appState,
    required this.inputEnabled,
    required this.loginResponse,
  });

  const LoginData.initial()
      : inputEnabled = true,
        loginResponse = null;

  @override
  List<Object?> get props => [
        super.appState,
        inputEnabled,
        loginResponse,
      ];
}
