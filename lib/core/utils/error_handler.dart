import 'dart:developer';

import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';
import 'exceptions.dart';

class ErrorHandler {
  static late BuildContext myContext;
  static late VoidCallback resetState;
  static void init(BuildContext context, VoidCallback voidCallback) {
    myContext = context;
    resetState = voidCallback;
  }

  static void onError(Object error, StackTrace stackTrace) {
    const String title = 'Triggers asynchrounous error\n';
    final String errorType = 'Error Type: ${error.runtimeType}\n';
    final String errorExplanation = 'Error Explanation: $error\n';
    final String errorReason = 'Error Reason:\n $stackTrace';
    log(title + errorType + errorExplanation + errorReason);

    resetState();

    if (error is NetworkException) {
      /// You can show Snackbar,
    } else if (error is AuthException) {
      /// You can go to Login Screen
    } else if (error is CustomException) {
      /// You can show Snackbar,
      final String errorMessage =
          error.message ?? myContext.locale.defaultErrorMessage;
    } else {
      /// TO DO:  Error Screen
    }
  }
}
