import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../core/model/api_response.dart';
import '../models/auth/login_request.dart';
import '../models/auth/login_response.dart';
import '../services/auth_service.dart';
import '../utils/api_response_helper.dart';

abstract class IAuthRepository {
  Future<LoginResponse> login(LoginRequest data);
}

@LazySingleton(as: IAuthRepository)
@immutable
final class AuthRepository implements IAuthRepository {
  final IAuthService _authService;

  const AuthRepository(this._authService);
  @override
  Future<LoginResponse> login(LoginRequest data) async {
    ApiResponse response = await _authService.login(
      data: data,
    );

    ApiResponseHelper.checkResponse(response);

    return LoginResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
