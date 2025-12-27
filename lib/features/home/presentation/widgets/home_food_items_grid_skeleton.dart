import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/food_item_skeleton.dart';

/// Skeleton loading widget for food items grid
class HomeFoodItemsGridSkeleton extends StatelessWidget {
  const HomeFoodItemsGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 6, // Mostrar 6 skeletons
        itemBuilder: (context, index) {
          return const FoodItemSkeleton();
        },
      ),
    );
  }
}

