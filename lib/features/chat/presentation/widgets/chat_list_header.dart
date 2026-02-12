import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';

/// Header widget for the chat contacts list page
class ChatListHeader extends StatelessWidget {
  const ChatListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'Messages',
        style: typography.heading4Bold.copyWith(
          color: colors.neutral100,
        ),
      ),
    );
  }
}
