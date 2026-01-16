import 'package:e_commerce_app_base/features/home/data/models/category_dto.dart';
import 'package:e_commerce_app_base/features/home/data/models/product_image_dto.dart';
import 'package:e_commerce_app_base/features/home/data/models/quantity_rules_dto.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';

/// Data Transfer Object (DTO) para Product
class ProductDTO extends ProductEntity {
  const ProductDTO({
    required super.id,
    required super.productName,
    required super.totalInStock,
    required super.price,
    required super.tags,
    required super.discountPercentage,
    required super.detailOfProduct,
    required super.images,
    required super.isSuspended,
    required super.category,
    required super.createdAt,
    required super.updatedAt,
    required super.description,
    required super.isFavorite,
    required super.sellBy,
    required super.unit,
    super.quantityRules,
  });

  /// Crea un ProductDTO desde un JSON
  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    // Parsear imágenes
    final imagesJson = json['images'] as List<dynamic>? ?? [];
    final images = imagesJson
        .map((img) => ProductImageDTO.fromJson(img as Map<String, dynamic>))
        .toList();

    // Parsear quantityRules
    final quantityRulesJson = json['quantityRules'] as Map<String, dynamic>?;
    final quantityRules = quantityRulesJson != null
        ? QuantityRulesDTO.fromJson(quantityRulesJson)
        : null;

    return ProductDTO(
      id: json['id'] as String,
      productName: json['productName'] as String,
      totalInStock: json['totalInStock'] as int,
      price: (json['price'] as num).toDouble(),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      detailOfProduct: json['detailOfProduct'] as String? ?? '',
      images: images,
      isSuspended: json['isSuspended'] as bool? ?? false,
      category: CategoryDTO.fromJson(json['category'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String? ?? '',
      isFavorite: json['isFavorite'] as bool? ?? false,
      sellBy: json['sellBy'] as String? ?? 'UNIT',
      unit: json['unit'] as String? ?? 'pc',
      quantityRules: quantityRules,
    );
  }

  /// Convierte el DTO a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'totalInStock': totalInStock,
      'price': price,
      'tags': tags,
      'discountPercentage': discountPercentage,
      'detailOfProduct': detailOfProduct,
      'images': images.map((img) => (img as ProductImageDTO).toJson()).toList(),
      'isSuspended': isSuspended,
      'category': (category as CategoryDTO).toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'description': description,
      'isFavorite': isFavorite,
      'sellBy': sellBy,
      'unit': unit,
      if (quantityRules != null)
        'quantityRules': (quantityRules as QuantityRulesDTO).toJson(),
    };
  }

  /// Convierte el DTO a entidad del dominio
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      productName: productName,
      totalInStock: totalInStock,
      price: price,
      tags: tags,
      discountPercentage: discountPercentage,
      detailOfProduct: detailOfProduct,
      images: images.map((img) => (img as ProductImageDTO).toEntity()).toList(),
      isSuspended: isSuspended,
      category: (category as CategoryDTO).toEntity(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      description: description,
      isFavorite: isFavorite,
      sellBy: sellBy,
      unit: unit,
      quantityRules: (quantityRules as QuantityRulesDTO?)?.toEntity(),
    );
  }
}
