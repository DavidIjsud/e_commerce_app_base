import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/food_item_view_model.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';

/// Individual food item card
///
/// Displays a single food item with image, name, rating, distance, and price
class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    super.key,
    required this.item,
    required this.onFavoriteTap,
  });

  final FoodItemViewModel item;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

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
                  child: item.imagePath.startsWith('http')
                      ? Image.network(
                          item.imagePath,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback si la imagen de red falla
                            return Image.asset(
                              item.imagePath,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          item.imagePath,
                          width: double.infinity,
                          fit: BoxFit.cover,
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
                        item.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: item.isFavorite
                            ? Colors.red
                            : colors.neutral60,
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
                    item.name,
                    style: typography.bodyMediumBold.copyWith(
                      color: colors.neutral100,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.rating.toString(),
                        style: typography.bodySmallRegular.copyWith(
                          color: colors.neutral60,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.location_on,
                        color: colors.neutral60,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.distance,
                        style: typography.bodySmallRegular.copyWith(
                          color: colors.neutral60,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    item.price,
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

