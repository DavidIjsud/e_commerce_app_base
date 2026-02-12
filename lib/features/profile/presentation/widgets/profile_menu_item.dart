import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';

/// A single tappable row in the profile menu.
///
/// Shows an icon inside a rounded square container, a label,
/// and a chevron on the right.
class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  /// When true, the label and icon are shown in red (used for destructive actions)
  final bool isDestructive;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    final labelColor = isDestructive ? colors.errorMainRed : colors.neutral100;
    final iconColor = isDestructive ? colors.errorMainRed : colors.neutral80;
    final iconBgColor = isDestructive ? colors.errorSurfaceRed : colors.primarySurfaceIris;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),
            const SizedBox(width: 14),
            // Label
            Expanded(
              child: Text(
                label,
                style: typography.bodyLargeMedium.copyWith(color: labelColor),
              ),
            ),
            // Chevron
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: colors.neutral50,
            ),
          ],
        ),
      ),
    );
  }
}
