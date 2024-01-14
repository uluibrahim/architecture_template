import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../core/model/api_response.dart';
import '../../core/utils/exceptions.dart';

@immutable
final class ApiResponseHelper {
  /// [source] decode
  /// [source] as Map<String,dynamic>
  static ApiResponse apiResponseAsMap(String source) {
    return ApiResponse.fromJson(jsonDecode(source) as Map<String, dynamic>);
  }

  /// Check response isSuccess and description
  /// If isError true, will throw Custom exeption with error message
  static void checkResponse(ApiResponse response) {
    if (response.isError) {
      throw CustomException(response.errorMessage);
    }
  }
}
