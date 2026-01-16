import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';

/// Individual food item card
///
/// Displays a single food item with image, name, rating, distance, and price
class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    super.key,
    required this.product,
    required this.onFavoriteTap,
  });

  final ProductEntity product;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    final imagePath = product.firstImageUrl;
    final formattedPrice = '\$ ${product.priceWithDiscount.toStringAsFixed(2)}';

    return Container(
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
          // Image with favorite icon
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: imagePath.startsWith('http')
                      ? Image.network(
                          imagePath,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              color: colors.neutral20,
                              child: Icon(
                                Icons.image_not_supported,
                                color: colors.neutral60,
                                size: 48,
                              ),
                            );
                          },
                        )
                      : imagePath.isNotEmpty
                          ? Image.asset(
                              imagePath,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: double.infinity,
                              color: colors.neutral20,
                              child: Icon(
                                Icons.image_not_supported,
                                color: colors.neutral60,
                                size: 48,
                              ),
                            ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: product.isFavorite ? Colors.red : colors.neutral60,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: typography.bodyMediumBold.copyWith(
                      color: colors.neutral100,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  if (product.hasDiscount)
                    Row(
                      children: [
                        Text(
                          '\$ ${product.price.toStringAsFixed(2)}',
                          style: typography.bodySmallRegular.copyWith(
                            color: colors.neutral60,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '-${product.discountPercentage.toStringAsFixed(0)}%',
                            style: typography.bodySmallRegular.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  const Spacer(),
                  Text(
                    formattedPrice,
                    style: typography.bodyMediumBold.copyWith(
                      color: colors.primaryHoverIris,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
