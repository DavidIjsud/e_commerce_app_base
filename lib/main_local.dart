import 'dart:developer';

import 'package:e_commerce_app_base/boostrap.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/flavor_config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:e_commerce_app_base/features/chat/presentation/blocs/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

void main() async {
  try {
    await dotenv.load(fileName: '.env.local');
    log('Environment variables loaded successfully');
  } catch (e) {
    log('Error loading environment variables: $e');
  }

  final config = FlavorConfig.initConfig(Flavor.ecommerceLocal);

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

    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>.value(value: Get.injector<CartBloc>()),
        BlocProvider<ChatBloc>.value(value: Get.injector<ChatBloc>()),
      ],
      child: MaterialApp.router(
        title: 'E-Commerce App',
        theme: config.theme.light(),
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'), // Default to English
      ),
    );
  }
}
