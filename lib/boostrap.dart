import 'dart:async';

import 'package:flutter/material.dart';

Future<void> boostrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await builder());
}
