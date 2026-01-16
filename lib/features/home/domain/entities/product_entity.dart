import 'package:e_commerce_app_base/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_image_entity.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/quantity_rules_entity.dart';

/// Entidad Product del dominio
///
/// Representa un producto en la capa de dominio
class ProductEntity {
  final String id;
  final String productName;
  final int totalInStock;
  final double price;
  final List<String> tags;
  final double discountPercentage;
  final String detailOfProduct;
  final List<ProductImageEntity> images;
  final bool isSuspended;
  final CategoryEntity category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String description;
  final bool isFavorite;
  final String sellBy;
  final String unit;
  final QuantityRulesEntity? quantityRules;

  const ProductEntity({
    required this.id,
    required this.productName,
    required this.totalInStock,
    required this.price,
    required this.tags,
    required this.discountPercentage,
    required this.detailOfProduct,
    required this.images,
    required this.isSuspended,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.isFavorite,
    required this.sellBy,
    required this.unit,
    this.quantityRules,
  });

  /// Obtiene la URL de la primera imagen, o una cadena vacía si no hay imágenes
  String get firstImageUrl {
    if (images.isEmpty) return '';
    return images.first.url;
  }

  /// Precio con descuento aplicado
  double get priceWithDiscount {
    if (discountPercentage > 0) {
      return price * (1 - discountPercentage / 100);
    }
    return price;
  }

  /// Indica si el producto tiene descuento
  bool get hasDiscount => discountPercentage > 0;
}
