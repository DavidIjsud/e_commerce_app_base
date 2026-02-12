import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_states.dart';

/// Payment summary section for the cart page
class CartPaymentSummary extends StatelessWidget {
  const CartPaymentSummary({super.key});

  String _formatPrice(double price) {
    final priceInt = price.round();
    final priceStr = priceInt.toString();
    final formatted = priceStr.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return '\$$formatted';
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (!state.hasItems) {
          return const SizedBox.shrink();
        }

        return Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Summary',
                style: typography.heading6Bold.copyWith(
                  color: colors.neutral100,
                ),
              ),
              const SizedBox(height: 16),
              // Total Items
              _buildRow(
                context,
                'Total Items (${state.selectedItemsCount})',
                _formatPrice(state.subtotal),
                typography,
                colors,
              ),
              const SizedBox(height: 12),
              // Delivery Fee
              _buildRow(
                context,
                'Delivery Fee',
                state.deliveryFee == 0
                    ? 'Free'
                    : _formatPrice(state.deliveryFee),
                typography,
                colors,
              ),
              // Discount (only show if applied)
              if (state.promoDiscount > 0) ...[
                const SizedBox(height: 12),
                _buildRow(
                  context,
                  'Discount',
                  '-${_formatPrice(state.discountAmount)}',
                  typography,
                  colors,
                  valueColor: colors.errorMainRed,
                ),
              ],
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              // Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: typography.bodyLargeBold.copyWith(
                      color: colors.neutral100,
                    ),
                  ),
                  Text(
                    _formatPrice(state.total),
                    style: typography.bodyLargeBold.copyWith(
                      color: colors.primaryHoverIris,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRow(
    BuildContext context,
    String label,
    String value,
    dynamic typography,
    dynamic colors, {
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: typography.bodyMediumRegular.copyWith(
            color: colors.neutral60,
          ),
        ),
        Text(
          value,
          style: typography.bodyMediumMedium.copyWith(
            color: valueColor ?? colors.neutral100,
          ),
        ),
      ],
    );
  }
}
