import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/config/assets/ecommerce.dart';

/// Individual category card
///
/// Displays a single category with image and name
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final CategoryEntity category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final assets = config.assets as EcommerceAssets;

    final categoryIcon = _getCategoryIcon(category.name, assets);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? colors.primaryHoverIris
              : Colors.white,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              categoryIcon,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: typography.bodySmallMedium.copyWith(
                color: isSelected
                    ? Colors.white
                    : colors.neutral100,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  /// Gets category icon based on category name
  String _getCategoryIcon(String categoryName, EcommerceAssets assets) {
    final name = categoryName.toLowerCase();
    if (name.contains('bebida') || name.contains('drink')) {
      return assets.homeCategoryDrink;
    } else if (name.contains('hamburger') || name.contains('burger')) {
      return assets.homeCategoryHamburger;
    } else if (name.contains('taco')) {
      return assets.homeCategoryTaco;
    } else if (name.contains('pizza')) {
      return assets.homeCategoryPizza;
    }
    // Fallback: use hamburger icon by default
    return assets.homeCategoryHamburger;
  }
}
