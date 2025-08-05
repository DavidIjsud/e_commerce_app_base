import 'package:e_commerce_app_base/boostrap.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/flavor_config.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: config.theme.light(),
      home: const OnboardingPage(),
    );
  }
}
