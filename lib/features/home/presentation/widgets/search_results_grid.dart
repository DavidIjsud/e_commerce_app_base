import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/search_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/food_item_view_model.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/food_item_card.dart';
import 'package:e_commerce_app_base/navigation/app_router.dart';

class SearchResultsGrid extends StatelessWidget {
  const SearchResultsGrid({super.key, required this.results});

  final List<FoodItemViewModel> results;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75, // Adjust based on FoodItemCard dimensions
      ),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];

        return GestureDetector(
          onTap: () {
            final searchBloc = context.read<SearchBloc>();
            final product = searchBloc.state.allProducts.firstWhere(
              (p) => p.id == item.id,
            );
            context.push(AppRouter.productDetail, extra: product);
          },
          child: FoodItemCard(
            item: item,
            onFavoriteTap: () {
              // TODO: Implement favorite toggle
              // Will be implemented when adding favorite functionality
            },
          ),
        );
      },
    );
  }
}
