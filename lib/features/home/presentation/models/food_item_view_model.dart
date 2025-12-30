import 'package:equatable/equatable.dart';

/// ViewModel para items de comida/productos en la capa de presentación
///
/// Representa un producto formateado para la UI, con campos específicos
/// de presentación como rating, distance, y precio formateado.
/// Este ViewModel se crea a partir de ProductEntity mediante mapeo.
class FoodItemViewModel extends Equatable {
  const FoodItemViewModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.distance,
    required this.price,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final String imagePath;
  final double rating;
  final String distance; // e.g., "190m"
  final String price; // e.g., "$ 17,230"
  final bool isFavorite;

  FoodItemViewModel copyWith({
    String? id,
    String? name,
    String? imagePath,
    double? rating,
    String? distance,
    String? price,
    bool? isFavorite,
  }) {
    return FoodItemViewModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      rating: rating ?? this.rating,
      distance: distance ?? this.distance,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imagePath,
        rating,
        distance,
        price,
        isFavorite,
      ];
}



