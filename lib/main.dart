import 'package:architecture_template/product/init/application_initialize.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  await ApplicationInitialize.initialize();
  runApp(App());
}
