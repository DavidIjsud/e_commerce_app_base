import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Header widget for the registration page with back button
class RegistrationHeader extends StatelessWidget {
  const RegistrationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back Button
        IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back, color: colors.neutral100),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(height: 16),
        // Title
        Text(
          l10n.registration_title,
          style: typography.heading1Bold.copyWith(
            color: colors.neutral100,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 8),
        // Subtitle
        Text(
          l10n.registration_subtitle,
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
