import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/orders/domain/entities/order_entity.dart';
import 'package:e_commerce_app_base/features/orders/presentation/widgets/order_status_badge.dart';

/// Card that summarises a single order in the list
class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final OrderEntity order;

  String get _formattedTotal {
    final amount = order.totalAmount;
    final formatted = amount.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?=\.))'),
          (m) => '${m[1]},',
        );
    return '\$$formatted';
  }

  String get _productsSummary {
    if (order.products.isEmpty) return '';
    if (order.products.length == 1) return order.products.first.productName;
    return '${order.products.first.productName} +${order.products.length - 1} more';
  }

  String get _shortId => '#${order.id.substring(order.id.length - 6).toUpperCase()}';

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top row: order ID + date ──────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _shortId,
                  style: typography.bodyMediumBold.copyWith(
                    color: colors.neutral100,
                  ),
                ),
                Text(
                  _formatDate(order.createdAt),
                  style: typography.bodySmallRegular.copyWith(
                    color: colors.neutral60,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // ── Products summary ──────────────────────────────────────────
            Text(
              _productsSummary,
              style: typography.bodySmallRegular.copyWith(
                color: colors.neutral70,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 14),

            Divider(color: colors.neutral30, height: 1),

            const SizedBox(height: 14),

            // ── Bottom row: badges + total ────────────────────────────────
            Row(
              children: [
                // Status badges
                OrderStatusBadge(status: order.status),
                const SizedBox(width: 8),
                OrderPaymentStatusBadge(status: order.paymentStatus),

                const Spacer(),

                // Total
                Text(
                  _formattedTotal,
                  style: typography.bodyMediumBold.copyWith(
                    color: colors.primaryHoverIris,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
