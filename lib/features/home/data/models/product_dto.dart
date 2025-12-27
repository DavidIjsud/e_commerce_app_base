import 'package:e_commerce_app_base/features/home/data/models/category_dto.dart';
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
    required super.image,
    required super.isSuspended,
    required super.category,
    required super.createdAt,
    required super.updatedAt,
    required super.description,
    required super.isFavorite,
  });

  /// Crea un ProductDTO desde un JSON
  factory ProductDTO.fromJson(Map<String, dynamic> json) {
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
      image: json['image'] as String? ?? '',
      isSuspended: json['isSuspended'] as bool? ?? false,
      category: CategoryDTO.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String? ?? '',
      isFavorite: json['isFavorite'] as bool? ?? false,
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
      'image': image,
      'isSuspended': isSuspended,
      'category': (category as CategoryDTO).toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'description': description,
      'isFavorite': isFavorite,
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
      image: image,
      isSuspended: isSuspended,
      category: (category as CategoryDTO).toEntity(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      description: description,
      isFavorite: isFavorite,
    );
  }
}

