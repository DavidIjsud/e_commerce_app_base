import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_image_entity.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/config/assets/ecommerce.dart';
import 'package:e_commerce_app_base/injector.dart';

/// Image carousel widget for product detail page
///
/// Displays a swipeable carousel of product images with page indicators
class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({
    super.key,
    required this.images,
    required this.onPageChanged,
    required this.currentIndex,
  });

  final List<ProductImageEntity> images;
  final ValueChanged<int> onPageChanged;
  final int currentIndex;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  void didUpdateWidget(ProductImageCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _pageController.animateToPage(
        widget.currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final assets = config.assets as EcommerceAssets;

    if (widget.images.isEmpty) {
      // Fallback si no hay imágenes
      return SizedBox(
        height: 300,
        width: double.infinity,
        child: Image.asset(
          assets.homeCategoryItemHamburger,
          fit: BoxFit.cover,
        ),
      );
    }

    return Stack(
      children: [
        // Image carousel
        SizedBox(
          height: 300,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: widget.onPageChanged,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              final image = widget.images[index];
              return Image.network(
                image.url,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    assets.homeCategoryItemHamburger,
                    fit: BoxFit.cover,
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              );
            },
          ),
        ),
        // Page indicators
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
              (index) => Container(
                width: index == widget.currentIndex ? 24 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index == widget.currentIndex
                      ? const Color(0xFFFF6B35) // Orange color
                      : Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

