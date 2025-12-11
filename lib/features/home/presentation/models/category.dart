import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/food_item.dart';

/// Temporary model for food categories
/// 
/// This will be replaced with API data in the future
class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.items,
    this.isSelected = false,
  });

  final String id;
  final String name;
  final String imagePath;
  final List<FoodItem> items;
  final bool isSelected;

  Category copyWith({
    String? id,
    String? name,
    String? imagePath,
    List<FoodItem>? items,
    bool? isSelected,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      items: items ?? this.items,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imagePath,
        items,
        isSelected,
      ];
}

