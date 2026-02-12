import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';

/// Header widget for the cart page
class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // Go back or switch to home tab
              Navigator.of(context).maybePop();
            },
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: colors.neutral20),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: colors.neutral100,
                size: 20,
              ),
            ),
          ),
          Text(
            'My Cart',
            style: typography.heading5Bold.copyWith(
              color: colors.neutral100,
            ),
          ),
          IconButton(
            onPressed: () {
              // Show cart options menu
            },
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: colors.neutral20),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.more_horiz,
                color: colors.neutral100,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
