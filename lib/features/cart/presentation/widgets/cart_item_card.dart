import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/cart/domain/entities/cart_item_entity.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_events.dart';

/// Individual cart item card widget
class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.item,
    required this.isSelected,
  });

  final CartItemEntity item;
  final bool isSelected;

  String get _formattedQuantity {
    final isWholeNumber = item.quantity == item.quantity.toInt();
    final quantityStr = isWholeNumber
        ? item.quantity.toInt().toString()
        : item.quantity.toStringAsFixed(1);

    if (item.unit != 'pc') {
      return '$quantityStr ${item.unit}';
    }
    return quantityStr;
  }

  String get _formattedPrice {
    final priceInt = item.unitPrice.round();
    final priceStr = priceInt.toString();
    final formatted = priceStr.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return '\$ $formatted';
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(12),
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
      child: Row(
        children: [
          // Checkbox
          Checkbox(
            value: isSelected,
            onChanged: (_) {
              context.read<CartBloc>().add(
                    CartItemSelectionToggled(item.productId),
                  );
            },
            activeColor: colors.primaryHoverIris,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: item.imageUrl.isNotEmpty
                ? Image.network(
                    item.imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 80,
                        height: 80,
                        color: colors.neutral20,
                        child: Icon(
                          Icons.image_not_supported,
                          color: colors.neutral60,
                        ),
                      );
                    },
                  )
                : Container(
                    width: 80,
                    height: 80,
                    color: colors.neutral20,
                    child: Icon(
                      Icons.image_not_supported,
                      color: colors.neutral60,
                    ),
                  ),
          ),
          const SizedBox(width: 12),
          // Product info and controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: typography.bodyMediumBold.copyWith(
                    color: colors.neutral100,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  _formattedPrice,
                  style: typography.bodyMediumBold.copyWith(
                    color: colors.primaryHoverIris,
                  ),
                ),
                const SizedBox(height: 8),
                // Quantity controls
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<CartBloc>().add(
                              CartItemQuantityDecremented(item.productId),
                            );
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: colors.neutral20,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        _formattedQuantity,
                        style: typography.bodyMediumBold.copyWith(
                          color: colors.neutral100,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CartBloc>().add(
                              CartItemQuantityIncremented(item.productId),
                            );
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: colors.primaryHoverIris,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Delete button
          IconButton(
            onPressed: () {
              context.read<CartBloc>().add(
                    CartItemRemoved(item.productId),
                  );
            },
            icon: Icon(
              Icons.delete_outline,
              color: colors.errorMainRed,
            ),
          ),
        ],
      ),
    );
  }
}
