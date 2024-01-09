part of '../init/config/app_environment.dart';

enum AppEnvItems {
  baseUrl,
  apiKey;

  String get value {
    try {
      switch (this) {
        case AppEnvItems.baseUrl:
          return AppEnvironment._configuration.baseUrl;
        case AppEnvItems.apiKey:
          return AppEnvironment._configuration.apiKey;
      }
    } catch (e) {
      throw Exception("AppEnvironment is not initialized");
    }
  }
}
