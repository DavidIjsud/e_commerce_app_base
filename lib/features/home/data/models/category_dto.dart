import 'package:e_commerce_app_base/features/home/domain/entities/category_entity.dart';

/// Data Transfer Object (DTO) para Category
class CategoryDTO extends CategoryEntity {
  const CategoryDTO({
    required super.id,
    required super.name,
  });

  /// Crea un CategoryDTO desde un JSON
  factory CategoryDTO.fromJson(Map<String, dynamic> json) {
    return CategoryDTO(
      id: json['id'] as String,
      name: json['categoryName'] as String,
    );
  }

  /// Convierte el DTO a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryName': name,
    };
  }

  /// Convierte el DTO a entidad del dominio
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
    );
  }
}



