import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';

/// State for product detail page
class ProductDetailState extends Equatable {
  ProductDetailState({
    required this.product,
    num? quantity,
    this.currentImageIndex = 0,
  }) : quantity = quantity ?? product.quantityRules?.minQuantity ?? 1;

  final ProductEntity product;
  final num quantity;
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

  /// Get formatted unit price with unit context (e.g., "$35/kg" or "$5/pc")
  String get formattedUnitPrice {
    final priceInt = product.priceWithDiscount.round();
    final priceStr = priceInt.toString();
    final formatted = priceStr.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    final unit = product.unit;
    if (unit != 'pc') {
      return '\$ $formatted/$unit';
    }
    return '\$ $formatted/unit';
  }

  ProductDetailState copyWith({
    ProductEntity? product,
    num? quantity,
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
