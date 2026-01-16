import 'package:e_commerce_app_base/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_events.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_states.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/food_item_card.dart';
import 'package:go_router/go_router.dart';

/// Food items grid widget
///
/// Displays a 2-column grid of food items
class HomeFoodItemsGrid extends StatelessWidget {
  const HomeFoodItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final products = state.selectedCategoryProducts;

        if (products.isEmpty) {
          return const SizedBox.shrink();
        }

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
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  context.push(AppRouter.productDetail, extra: product);
                },
                child: FoodItemCard(
                  product: product,
                  onFavoriteTap: () {
                    context.read<HomeBloc>().add(
                      FoodItemFavoriteToggled(product.id),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
