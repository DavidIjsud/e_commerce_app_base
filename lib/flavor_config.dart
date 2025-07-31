import 'package:e_commerce_app_base/config/assets/ecommerce.dart';
import 'package:e_commerce_app_base/config/assets/palmyra_assets.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/themes/palmyrasoft_theme.dart';

abstract class FlavorConfig {
  static Config initConfig() {
    final flavor = _resolveFlavor(String.fromEnvironment('FLAVOR', defaultValue: 'ecommerceDevelopment'));
    return Config(theme: _resolveTheme(flavor), assets: _resolveAssets(flavor), flavor: flavor);
  }

  static PalmyraSoftTheme _resolveTheme(Flavor flavor) {
    switch (flavor) {
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
      case Flavor.ecommerceDevelopment:
        return EcommerceAssets();
      case Flavor.ecommerceProduction:
        return EcommerceAssets();
      case Flavor.ecommerceStaging:
        return EcommerceAssets();
    }
  }

  static Flavor _resolveFlavor(String flavorName) {
    switch (flavorName) {
      case 'ecommerceDevelopment':
        return Flavor.ecommerceDevelopment;
      case 'ecommerceProduction':
        return Flavor.ecommerceProduction;
      case 'ecommerceStaging':
        return Flavor.ecommerceStaging;
      default:
        throw Exception('Unknown flavor: $flavorName');
    }
  }
}
