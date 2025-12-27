import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/food_item_view_model.dart';

/// ViewModel para categorías en la capa de presentación
///
/// Representa una categoría formateada para la UI, incluyendo
/// los items asociados y el estado de selección.
class CategoryViewModel extends Equatable {
  const CategoryViewModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.items,
    this.isSelected = false,
  });

  final String id;
  final String name;
  final String imagePath;
  final List<FoodItemViewModel> items;
  final bool isSelected;

  CategoryViewModel copyWith({
    String? id,
    String? name,
    String? imagePath,
    List<FoodItemViewModel>? items,
    bool? isSelected,
  }) {
    return CategoryViewModel(
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

