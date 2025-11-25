import 'package:e_commerce_app_base/boostrap.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/flavor_config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  final config = FlavorConfig.initConfig();

  boostrap(() async {
    return MyApp(config: config);
  }, config);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.config});

  final Config config;

  @override
  Widget build(BuildContext context) {
    final router = Get.injector<GoRouter>();

    return MaterialApp.router(
      title: 'E-Commerce App',
      theme: config.theme.light(),
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'), // Default to English
    );
  }
}
