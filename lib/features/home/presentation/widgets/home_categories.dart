import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_events.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_states.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/category_card.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Categories section widget
///
/// Displays horizontal scrollable list of category cards
class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.home_find_by_category,
                    style: typography.heading4Bold.copyWith(
                      color: colors.neutral100,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to all categories
                    },
                    child: Text(
                      l10n.home_see_all,
                      style: typography.bodyMediumMedium.copyWith(
                        color: colors.primaryHoverIris,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  return CategoryCard(
                    category: category,
                    isSelected: state.isCategorySelected(category.id),
                    onTap: () {
                      context.read<HomeBloc>().add(
                        CategorySelected(category.id),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
