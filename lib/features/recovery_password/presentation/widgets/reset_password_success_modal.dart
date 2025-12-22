import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/config/assets/ecommerce.dart';
import 'package:e_commerce_app_base/core/widgets/primary_button.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';
import 'package:e_commerce_app_base/navigation/app_router.dart';

/// Success modal bottom sheet for password reset
///
/// Displays success illustration, message, and button to go back to login
class ResetPasswordSuccessModal extends StatelessWidget {
  const ResetPasswordSuccessModal({super.key});

  /// Shows the success modal bottom sheet
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ResetPasswordSuccessModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final assets = config.assets as EcommerceAssets;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top drag indicator bar
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: colors.neutral40,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Success illustration
              Image.asset(
                assets.resetPasswordSuccessIllustration,
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 32),
              // Title
              Text(
                l10n.reset_password_success_title,
                style: typography.heading1Bold.copyWith(
                  color: colors.neutral100,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              // Description
              Text(
                l10n.reset_password_success_message,
                style: typography.bodyMediumRegular.copyWith(
                  color: colors.neutral60,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Back to login button
              PrimaryButton(
                text: l10n.reset_password_success_back_to_login,
                onPressed: () {
                  Navigator.of(context).pop(); // Close modal
                  context.go(AppRouter.login);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
