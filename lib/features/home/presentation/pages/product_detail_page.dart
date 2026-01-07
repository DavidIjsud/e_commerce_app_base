import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/product_detail_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/product_detail_events.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/product_detail_states.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/product_image_carousel.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/quantity_selector.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';

/// Product detail page
///
/// Displays detailed information about a product including images, description, and quantity selector
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailBloc(product: product)
        ..add(const ProductDetailInitialized()),
      child: const _ProductDetailView(),
    );
  }
}

class _ProductDetailView extends StatelessWidget {
  const _ProductDetailView();

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              // App bar with back button and favorite
              SliverAppBar(
                expandedHeight: 0,
                floating: true,
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => context.pop(),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  'About This Menu',
                  style: typography.heading5Bold.copyWith(
                    color: Colors.black,
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        state.product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: state.product.isFavorite
                            ? Colors.red
                            : colors.neutral60,
                      ),
                      onPressed: () {
                        context
                            .read<ProductDetailBloc>()
                            .add(const ProductDetailFavoriteToggled());
                      },
                    ),
                  ),
                ],
              ),
              // Image carousel
              SliverToBoxAdapter(
                child: ProductImageCarousel(
                  images: state.product.images,
                  currentIndex: state.currentImageIndex,
                  onPageChanged: (index) {
                    context
                        .read<ProductDetailBloc>()
                        .add(ProductDetailImagePageChanged(index));
                  },
                ),
              ),
              // Product details card
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product name with emoji
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${state.product.productName} 🍔',
                                style: typography.heading3Bold.copyWith(
                                  color: colors.neutral100,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Unit price
                        Text(
                          state.formattedUnitPrice,
                          style: typography.heading4Bold.copyWith(
                            color: colors.primaryHoverIris,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Rating
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '4.5', // Hardcoded as requested
                              style: typography.bodyMediumRegular.copyWith(
                                color: colors.neutral60,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Description
                        Text(
                          'Description',
                          style: typography.heading5Bold.copyWith(
                            color: colors.neutral100,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.product.description.isNotEmpty
                              ? state.product.description
                              : state.product.detailOfProduct,
                          style: typography.bodyMediumRegular.copyWith(
                            color: colors.neutral60,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Quantity selector and total price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            QuantitySelector(
                              quantity: state.quantity,
                              onIncrement: () {
                                context
                                    .read<ProductDetailBloc>()
                                    .add(const ProductDetailQuantityIncremented());
                              },
                              onDecrement: () {
                                context
                                    .read<ProductDetailBloc>()
                                    .add(const ProductDetailQuantityDecremented());
                              },
                            ),
                            Text(
                              state.formattedTotalPrice,
                              style: typography.heading4Bold.copyWith(
                                color: colors.primaryHoverIris,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      // Add to Cart button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                // Do nothing for now as requested
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primaryHoverIris,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart),
                  const SizedBox(width: 8),
                  Text(
                    'Add to Cart',
                    style: typography.bodyLargeBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

