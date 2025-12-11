import 'package:equatable/equatable.dart';

/// Temporary model for food items
/// 
/// This will be replaced with API data in the future
class FoodItem extends Equatable {
  const FoodItem({
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

  FoodItem copyWith({
    String? id,
    String? name,
    String? imagePath,
    double? rating,
    String? distance,
    String? price,
    bool? isFavorite,
  }) {
    return FoodItem(
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

