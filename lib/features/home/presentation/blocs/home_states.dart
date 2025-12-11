import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/category.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/food_item.dart';

/// Status enum for home
enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

/// State for home page
class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.categories = const [],
    this.selectedCategoryId,
    this.selectedLocation = 'Santa Cruz de la sierra',
    this.availableLocations = const [
      'Santa Cruz de la sierra',
      'La Paz',
      'Cochabamba',
    ],
    this.currentBottomNavTab = 0,
    this.errorMessage,
  });

  final HomeStatus status;
  final List<Category> categories;
  final String? selectedCategoryId;
  final String selectedLocation;
  final List<String> availableLocations;
  final int currentBottomNavTab;
  final String? errorMessage;

  /// Get selected category
  Category? get selectedCategory {
    if (selectedCategoryId == null) return null;
    try {
      return categories.firstWhere(
        (cat) => cat.id == selectedCategoryId,
      );
    } catch (_) {
      return null;
    }
  }

  /// Get food items for selected category
  List<FoodItem> get selectedCategoryItems {
    final category = selectedCategory;
    return category?.items ?? [];
  }

  HomeState copyWith({
    HomeStatus? status,
    List<Category>? categories,
    String? selectedCategoryId,
    String? selectedLocation,
    List<String>? availableLocations,
    int? currentBottomNavTab,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      availableLocations: availableLocations ?? this.availableLocations,
      currentBottomNavTab: currentBottomNavTab ?? this.currentBottomNavTab,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        categories,
        selectedCategoryId,
        selectedLocation,
        availableLocations,
        currentBottomNavTab,
        errorMessage,
      ];
}

