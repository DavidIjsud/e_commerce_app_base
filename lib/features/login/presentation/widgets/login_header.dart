import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Header widget for the login page
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.login_title,
          style: typography.heading1Bold.copyWith(
            color: config.theme.themeColors.neutral100,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.login_subtitle,
          style: typography.bodyLargeRegular.copyWith(
            color: config.theme.themeColors.neutral60,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
