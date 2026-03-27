import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/orders/domain/entities/order_entity.dart';

/// Colored chip that displays the order's lifecycle status
class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({super.key, required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final colors = Get.injector<Config>().theme.themeColors;
    final typography = Get.injector<Config>().theme.typography;

    final (label, bgColor, textColor) = switch (status) {
      OrderStatus.pending => (
          'Pending',
          colors.secondarySurfaceYellow,
          colors.secondaryHoverYellow,
        ),
      OrderStatus.confirmed => (
          'Confirmed',
          colors.infoSurfaceBlue,
          colors.infoMainBlue,
        ),
      OrderStatus.shipped => (
          'Shipped',
          colors.primarySurfaceIris,
          colors.primaryMainIris,
        ),
      OrderStatus.delivered => (
          'Delivered',
          colors.successSurfaceGreen,
          colors.successMainGreen,
        ),
      OrderStatus.cancelled => (
          'Cancelled',
          colors.errorSurfaceRed,
          colors.errorMainRed,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: typography.bodySmallMedium.copyWith(color: textColor),
      ),
    );
  }
}

/// Colored chip that displays the order's payment status
class OrderPaymentStatusBadge extends StatelessWidget {
  const OrderPaymentStatusBadge({super.key, required this.status});

  final PaymentStatus status;

  @override
  Widget build(BuildContext context) {
    final colors = Get.injector<Config>().theme.themeColors;
    final typography = Get.injector<Config>().theme.typography;

    final (label, bgColor, textColor) = switch (status) {
      PaymentStatus.pending => (
          'Unpaid',
          colors.secondarySurfaceYellow,
          colors.secondaryHoverYellow,
        ),
      PaymentStatus.paid => (
          'Paid',
          colors.successSurfaceGreen,
          colors.successMainGreen,
        ),
      PaymentStatus.failed => (
          'Failed',
          colors.errorSurfaceRed,
          colors.errorMainRed,
        ),
      PaymentStatus.refunded => (
          'Refunded',
          colors.infoSurfaceBlue,
          colors.infoMainBlue,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: typography.bodySmallMedium.copyWith(color: textColor),
      ),
    );
  }
}
