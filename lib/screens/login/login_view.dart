import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/screen/screen.dart';
import 'login_data.dart';
import 'login_view_model.dart';

part 'login_view_mixin.dart';

@RoutePage()
class LoginScreen extends Screen {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState
    extends ScreenState<LoginScreen, LoginViewModel, LoginData>
    with LoginViewMixin {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: body,
    );
  }
}
