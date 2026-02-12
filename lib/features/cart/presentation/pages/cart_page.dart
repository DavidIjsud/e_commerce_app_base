import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/features/cart/presentation/widgets/cart_header.dart';
import 'package:e_commerce_app_base/features/cart/presentation/widgets/cart_delivery_location.dart';
import 'package:e_commerce_app_base/features/cart/presentation/widgets/cart_promo_code_input.dart';
import 'package:e_commerce_app_base/features/cart/presentation/widgets/cart_items_list.dart';
import 'package:e_commerce_app_base/features/cart/presentation/widgets/cart_payment_summary.dart';
import 'package:e_commerce_app_base/features/cart/presentation/widgets/cart_order_button.dart';

/// Cart page content widget
///
/// This is the content displayed in the Shopping tab of the bottom navigation.
/// It shows the cart items, promo code input, payment summary, and order button.
class CartPageContent extends StatelessWidget {
  const CartPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 16),
          // Header
          const CartHeader(),
          const SizedBox(height: 24),
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Delivery location
                  const CartDeliveryLocation(),
                  const SizedBox(height: 16),
                  // Promo code input
                  const CartPromoCodeInput(),
                  const SizedBox(height: 16),
                  // Cart items list
                  const CartItemsList(),
                  // Payment summary
                  const CartPaymentSummary(),
                ],
              ),
            ),
          ),
          // Order button (fixed at bottom)
          const CartOrderButton(),
        ],
      ),
    );
  }
}
