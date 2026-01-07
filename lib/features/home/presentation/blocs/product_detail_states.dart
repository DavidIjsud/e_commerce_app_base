import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';

/// State for product detail page
class ProductDetailState extends Equatable {
  const ProductDetailState({
    required this.product,
    this.quantity = 1,
    this.currentImageIndex = 0,
  });

  final ProductEntity product;
  final int quantity;
  final int currentImageIndex;

  /// Get total price (unit price * quantity)
  double get totalPrice {
    return product.priceWithDiscount * quantity;
  }

  /// Get formatted total price
  String get formattedTotalPrice {
    final priceInt = totalPrice.round();
    final priceStr = priceInt.toString();
    final formatted = priceStr.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return '\$ $formatted';
  }

  /// Get formatted unit price
  String get formattedUnitPrice {
    final priceInt = product.priceWithDiscount.round();
    final priceStr = priceInt.toString();
    final formatted = priceStr.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return '\$ $formatted';
  }

  ProductDetailState copyWith({
    ProductEntity? product,
    int? quantity,
    int? currentImageIndex,
  }) {
    return ProductDetailState(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
    );
  }

  @override
  List<Object?> get props => [product, quantity, currentImageIndex];
}

