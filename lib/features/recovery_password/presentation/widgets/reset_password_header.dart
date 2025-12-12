import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Header widget for reset password page
///
/// Displays back button and title
class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back, color: colors.neutral100),
        ),
        Expanded(
          child: Text(
            l10n.reset_password_title,
            style: typography.bodyLargeSemibold.copyWith(
              color: colors.neutral100,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        // Spacer to balance the back button
        SizedBox(width: 48),
      ],
    );
  }
}
