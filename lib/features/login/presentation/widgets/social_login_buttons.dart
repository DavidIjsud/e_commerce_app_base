import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';
import 'package:e_commerce_app_base/features/login/presentation/widgets/social_button.dart';

/// Social login buttons widget
class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        // Separator
        Row(
          children: [
            Expanded(child: Divider(color: colors.neutral40, thickness: 1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                l10n.login_or_separator,
                style: typography.bodyMediumRegular.copyWith(
                  color: colors.neutral60,
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(child: Divider(color: colors.neutral40, thickness: 1)),
          ],
        ),
        const SizedBox(height: 24),

        // Social Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialButton(
              onPressed: () {
                // TODO: Implement Google login
              },
              child: SvgPicture.asset(
                config.assets.googleIcon,
                width: 24,
                height: 24,
                placeholderBuilder: (context) =>
                    const Icon(Icons.g_mobiledata, size: 24),
              ),
            ),
            SocialButton(
              onPressed: () {
                // TODO: Implement Facebook login
              },
              child: SvgPicture.asset(
                config.assets.facebookIcon,
                width: 24,
                height: 24,
                placeholderBuilder: (context) =>
                    const Icon(Icons.facebook, size: 24),
              ),
            ),
            SocialButton(
              onPressed: () {
                // TODO: Implement Apple login
              },
              child: SvgPicture.asset(
                config.assets.appleIcon,
                width: 24,
                height: 24,
                placeholderBuilder: (context) =>
                    const Icon(Icons.apple, size: 24),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
