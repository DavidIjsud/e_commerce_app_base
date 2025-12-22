import 'package:e_commerce_app_base/config/assets/ecommerce.dart';
import 'package:e_commerce_app_base/config/assets/palmyra_assets.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/themes/palmyrasoft_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class FlavorConfig {
  static Config initConfig(Flavor flavor) {
    return Config(
      theme: _resolveTheme(flavor),
      assets: _resolveAssets(flavor),
      flavor: flavor,
      apiBaseUrl: dotenv.env['API_BASE_URL']!,
    );
  }

  static PalmyraSoftTheme _resolveTheme(Flavor flavor) {
    switch (flavor) {
      case Flavor.ecommerceLocal:
        return PalmyraSoftTheme();
      case Flavor.ecommerceDevelopment:
        return PalmyraSoftTheme();
      case Flavor.ecommerceProduction:
        return PalmyraSoftTheme();
      case Flavor.ecommerceStaging:
        return PalmyraSoftTheme();
    }
  }

  static PalmyraAssets _resolveAssets(Flavor flavor) {
    switch (flavor) {
      case Flavor.ecommerceLocal:
        return EcommerceAssets();
      case Flavor.ecommerceDevelopment:
        return EcommerceAssets();
      case Flavor.ecommerceProduction:
        return EcommerceAssets();
      case Flavor.ecommerceStaging:
        return EcommerceAssets();
    }
  }
}
