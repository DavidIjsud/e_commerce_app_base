import 'package:e_commerce_app_base/config/assets/palmyra_assets.dart';
import 'package:e_commerce_app_base/themes/palmyrasoft_theme.dart';

enum Flavor { ecommerceDevelopment, ecommerceProduction, ecommerceStaging }

class Config {
  final PalmyraSoftTheme theme;
  final PalmyraAssets assets;
  final Flavor flavor;
  final String apiBaseUrl;

  Config({
    required this.theme,
    required this.assets,
    required this.flavor,
    required this.apiBaseUrl,
  });
}
