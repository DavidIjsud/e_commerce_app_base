import 'package:e_commerce_app_base/features/home/domain/entities/category_entity.dart';

/// Modelo de datos (DTO) para Category
class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
  });

  /// Crea un CategoryModel desde un JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['categoryName'] as String,
    );
  }

  /// Convierte el modelo a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryName': name,
    };
  }

  /// Convierte el modelo a entidad del dominio
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
    );
  }
}

