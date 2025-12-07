import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Header widget for OTP verification page
///
/// Displays a back button and "OTP" title
class OTPVerificationHeader extends StatelessWidget {
  const OTPVerificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      children: [
        // Back button
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(width: 16),
        // OTP title
        Text(
          l10n.otp_verification_title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

