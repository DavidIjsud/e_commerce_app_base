import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/models/notification_view_model.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/widgets/notification_item.dart';
import 'package:e_commerce_app_base/injector.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({
    super.key,
    required this.title,
    required this.notifications,
  });

  final String title;
  final List<NotificationViewModel> notifications;

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            title,
            style: typography.bodyMediumMedium.copyWith(
              color: colors.neutral60,
              fontSize: 14,
              letterSpacing: 0.5,
            ),
          ),
        ),
        ...notifications.map((notification) {
          final isLast = notification == notifications.last;
          return Column(
            children: [
              NotificationItem(notification: notification),
              if (!isLast)
                Divider(
                  color: colors.neutral20,
                  height: 1,
                  thickness: 1,
                ),
            ],
          );
        }).toList(),
        const SizedBox(height: 24),
      ],
    );
  }
}
