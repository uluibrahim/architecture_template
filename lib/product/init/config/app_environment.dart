import 'package:architecture_template/product/init/config/app_configurtaion.dart';
import 'package:architecture_template/product/init/config/dev/env_dev.dart';
import 'package:architecture_template/product/init/config/prod/env_prod.dart';
import 'package:flutter/foundation.dart';

part '../../enums/app_env_items.dart';
final class AppEnvironment {
  AppEnvironment.setup() {
    _configuration = kDebugMode ? EnvDev() : EnvProd();
  }
  static late final AppConfiguration _configuration;
}