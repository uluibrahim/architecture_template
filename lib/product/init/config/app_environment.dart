import 'package:architecture_template/product/init/config/app_configurtaion.dart';
import 'package:architecture_template/product/init/config/dev/env_dev.dart';
import 'package:architecture_template/product/init/config/prod/env_prod.dart';
import 'package:flutter/foundation.dart';

final class AppEnvironment {
  AppEnvironment.setup() {
    _configuration = kDebugMode ? EnvDev() : EnvProd();
  }
  static late final AppConfiguration _configuration;
}

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