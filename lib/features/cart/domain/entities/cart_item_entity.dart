import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/quantity_rules_entity.dart';

/// Entity representing an item in the shopping cart
class CartItemEntity extends Equatable {
  final String productId;
  final String productName;
  final String imageUrl;
  final double unitPrice;
  final num quantity;
  final String unit;
  final QuantityRulesEntity? quantityRules;

  const CartItemEntity({
    required this.productId,
    required this.productName,
    required this.imageUrl,
    required this.unitPrice,
    required this.quantity,
    required this.unit,
    this.quantityRules,
  });

  /// Total price for this item (unitPrice * quantity)
  double get totalPrice => unitPrice * quantity;

  /// Create a CartItemEntity from a ProductEntity
  factory CartItemEntity.fromProduct(ProductEntity product, num quantity) {
    return CartItemEntity(
      productId: product.id,
      productName: product.productName,
      imageUrl: product.firstImageUrl,
      unitPrice: product.priceWithDiscount,
      quantity: quantity,
      unit: product.unit,
      quantityRules: product.quantityRules,
    );
  }

  /// Create a copy with updated quantity
  CartItemEntity copyWith({num? quantity}) {
    return CartItemEntity(
      productId: productId,
      productName: productName,
      imageUrl: imageUrl,
      unitPrice: unitPrice,
      quantity: quantity ?? this.quantity,
      unit: unit,
      quantityRules: quantityRules,
    );
  }

  @override
  List<Object?> get props => [
        productId,
        productName,
        imageUrl,
        unitPrice,
        quantity,
        unit,
        quantityRules,
      ];
}
