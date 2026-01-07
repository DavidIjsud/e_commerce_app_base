import 'package:e_commerce_app_base/config/assets/palmyra_assets.dart';
import 'package:e_commerce_app_base/themes/colors/palmyrasoft_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/models/notification_view_model.dart';
import 'package:e_commerce_app_base/injector.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});

  final NotificationViewModel notification;

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final assets = config.assets;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon container
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: _getIconBackgroundColor(notification.type, colors),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: SvgPicture.asset(
                _getIconPath(notification.type, assets),
                width: 28,
                height: 28,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: typography.bodyLargeBold.copyWith(
                    color: colors.neutral100,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.description,
                  style: typography.bodyMediumRegular.copyWith(
                    color: colors.neutral60,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getIconBackgroundColor(
    NotificationType type,
    PalmyrasoftThemeColors colors,
  ) {
    switch (type) {
      case NotificationType.discount:
        return const Color(0xFFFFF0F0); // Light red/pink
      case NotificationType.success:
        return const Color(0xFFE8F5E9); // Light green
      case NotificationType.error:
        return const Color(0xFFFFEBEE); // Light red
      case NotificationType.email:
        return const Color(0xFFF3E5F5); // Light purple
      case NotificationType.account:
        return const Color(0xFFF5F5F5); // Light gray
      case NotificationType.payment:
        return const Color(0xFFFFF3E0); // Light orange
    }
  }

  String _getIconPath(NotificationType type, PalmyraAssets assets) {
    switch (type) {
      case NotificationType.discount:
        return assets.porcentRedIcon;
      case NotificationType.success:
        return assets.successCheckedGreenIcon;
      case NotificationType.error:
        return assets.errorRoundedRedIcon;
      case NotificationType.email:
        return assets.closedEmailIcon;
      case NotificationType.account:
        return assets.profileBlackIcon;
      case NotificationType.payment:
        return assets.cardOrangeIcon;
    }
  }
}
