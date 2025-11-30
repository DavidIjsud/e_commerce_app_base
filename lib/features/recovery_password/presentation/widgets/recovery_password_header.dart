import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Header widget for the recovery password page
class RecoveryPasswordHeader extends StatelessWidget {
  const RecoveryPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          l10n.recovery_password_title,
          style: typography.heading1Bold.copyWith(
            color: colors.neutral100,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 8),
        // Description
        Text(
          l10n.recovery_password_description,
          style: typography.bodyLargeRegular.copyWith(
            color: colors.neutral60,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

