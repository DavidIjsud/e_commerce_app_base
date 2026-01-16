import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/food_item_card.dart';
import 'package:e_commerce_app_base/navigation/app_router.dart';

class SearchResultsGrid extends StatelessWidget {
  const SearchResultsGrid({super.key, required this.results});

  final List<ProductEntity> results;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final product = results[index];

        return GestureDetector(
          onTap: () {
            context.push(AppRouter.productDetail, extra: product);
          },
          child: FoodItemCard(
            product: product,
            onFavoriteTap: () {
              // TODO: Implement favorite toggle
            },
          ),
        );
      },
    );
  }
}
