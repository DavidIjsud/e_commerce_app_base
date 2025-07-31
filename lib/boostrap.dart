import 'dart:async';

import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:flutter/material.dart';

Future<void> boostrap(FutureOr<Widget> Function() builder, Config config) async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.init(config: config);
  runApp(await builder());
}
