import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';

/// Circular avatar with a person icon and an optional online indicator
class ChatAvatar extends StatelessWidget {
  final bool isOnline;
  final double size;

  const ChatAvatar({
    super.key,
    this.isOnline = false,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Get.injector<Config>().theme.themeColors;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.neutral30,
          ),
          child: Icon(
            Icons.person,
            size: size * 0.55,
            color: colors.neutral60,
          ),
        ),
        if (isOnline)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size * 0.27,
              height: size * 0.27,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.successMainGreen,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
            ),
          ),
      ],
    );
  }
}
