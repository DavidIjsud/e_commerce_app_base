import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_states.dart';
import 'package:e_commerce_app_base/features/cart/presentation/widgets/cart_item_card.dart';

/// List of cart items
class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (!state.hasItems) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: colors.neutral40,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: typography.heading6Bold.copyWith(
                      color: colors.neutral60,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add some items to get started',
                    style: typography.bodyMediumRegular.copyWith(
                      color: colors.neutral40,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            final item = state.items.values.elementAt(index);
            final isSelected = state.selectedItemIds.contains(item.productId);

            return CartItemCard(
              item: item,
              isSelected: isSelected,
            );
          },
        );
      },
    );
  }
}
