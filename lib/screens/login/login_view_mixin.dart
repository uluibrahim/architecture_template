part of 'login_view.dart';

mixin LoginViewMixin
    on ScreenState<LoginScreen, LoginViewModel, LoginData> {
  AppBar get appbar => AppBar(
        title: const Text("Login Screen"),
      );

  Widget get body => const Center(child: Text("Login Screen"));
}
