import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/network_status_manager/network_status_manager.dart';
import '../../inject/dependency_injection.dart';

@immutable
final class ApplicationInitialize {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeGetIt(Environment.prod);
    await getIt.get<INetworkStatusManager>().init();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    FlutterError.onError = (details){
      // crashlytics 
    };
    
  }
}
