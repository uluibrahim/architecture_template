import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> initializeGetIt(String env) async => getIt.init(environment: env);

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

class $RegisterModule extends RegisterModule {}
