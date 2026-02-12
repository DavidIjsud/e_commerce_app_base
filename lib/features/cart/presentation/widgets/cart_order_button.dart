import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_states.dart';

/// Order now button for the cart page
class CartOrderButton extends StatelessWidget {
  const CartOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final isEnabled = state.hasSelectedItems;

        return Padding(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: isEnabled
                  ? () {
                      // TODO: Navigate to checkout or process order
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Order placed successfully!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isEnabled ? colors.primaryHoverIris : colors.neutral40,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
              ),
              child: Text(
                'Order Now',
                style: typography.bodyLargeBold.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
