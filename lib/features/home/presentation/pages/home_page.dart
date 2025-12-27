import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_events.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_states.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/home_header.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/home_categories.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/home_food_items_grid.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/home_food_items_grid_skeleton.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/home_bottom_navigation.dart';
import 'package:e_commerce_app_base/injector.dart';

/// Main home page
///
/// Displays header, categories, food items grid, and bottom navigation
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = Get.injector<HomeBloc>();
        bloc.add(const HomeInitialized());
        return bloc;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return Column(
                children: [
                  // Header with top image
                  HomeHeader(
                    selectedLocation: state.selectedLocation,
                    availableLocations: state.availableLocations,
                    onLocationChanged: (location) {
                      context.read<HomeBloc>().add(LocationChanged(location));
                    },
                  ),
                  // Content with skeleton
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          // Categories skeleton (puedes crear uno si quieres)
                          const SizedBox(height: 24),
                          // Food items grid skeleton
                          const HomeFoodItemsGridSkeleton(),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            if (state.status == HomeStatus.error) {
              return Center(
                child: Text(state.errorMessage ?? 'Error loading home'),
              );
            }

            return Column(
              children: [
                // Header with top image
                HomeHeader(
                  selectedLocation: state.selectedLocation,
                  availableLocations: state.availableLocations,
                  onLocationChanged: (location) {
                    context.read<HomeBloc>().add(LocationChanged(location));
                  },
                ),
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Categories
                        const HomeCategories(),
                        const SizedBox(height: 24),
                        // Food items grid
                        const HomeFoodItemsGrid(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: const HomeBottomNavigation(),
      ),
    );
  }
}
