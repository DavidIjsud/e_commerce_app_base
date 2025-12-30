import 'package:e_commerce_app_base/features/home/domain/entities/product_image_entity.dart';

/// Data Transfer Object (DTO) para ProductImage
class ProductImageDTO extends ProductImageEntity {
  const ProductImageDTO({
    required super.id,
    required super.url,
    super.mongoId,
  });

  /// Crea un ProductImageDTO desde un JSON
  factory ProductImageDTO.fromJson(Map<String, dynamic> json) {
    // El id puede venir como int o String
    final idValue = json['id'];
    final idString = idValue is int ? idValue.toString() : idValue as String;

    return ProductImageDTO(
      id: idString,
      url: json['url'] as String,
      mongoId: json['_id'] as String?,
    );
  }

  /// Convierte el DTO a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': int.tryParse(id) ?? id,
      'url': url,
      if (mongoId != null) '_id': mongoId,
    };
  }

  /// Convierte el DTO a entidad del dominio
  ProductImageEntity toEntity() {
    return ProductImageEntity(
      id: id,
      url: url,
      mongoId: mongoId,
    );
  }
}

