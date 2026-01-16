import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/category_entity.dart';

/// Status enum for home
enum HomeStatus { initial, loading, loaded, error }

/// State for home page
class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.categories = const [],
    this.productsByCategory = const {},
    this.selectedCategoryId,
    this.selectedLocation = 'Santa Cruz de la sierra',
    this.availableLocations = const [
      'Santa Cruz de la sierra',
      'La Paz',
      'Cochabamba',
    ],
    this.currentBottomNavTab = 0,
    this.errorMessage,
    this.productsById = const {},
  });

  final HomeStatus status;
  final List<CategoryEntity> categories;
  final Map<String, List<ProductEntity>> productsByCategory;
  final String? selectedCategoryId;
  final String selectedLocation;
  final List<String> availableLocations;
  final int currentBottomNavTab;
  final String? errorMessage;
  final Map<String, ProductEntity> productsById;

  /// Get selected category
  CategoryEntity? get selectedCategory {
    if (selectedCategoryId == null) return null;
    try {
      return categories.firstWhere((cat) => cat.id == selectedCategoryId);
    } catch (_) {
      return null;
    }
  }

  /// Get products for selected category
  List<ProductEntity> get selectedCategoryProducts {
    if (selectedCategoryId == null) return [];
    return productsByCategory[selectedCategoryId] ?? [];
  }

  /// Check if a category is selected
  bool isCategorySelected(String categoryId) {
    return selectedCategoryId == categoryId;
  }

  HomeState copyWith({
    HomeStatus? status,
    List<CategoryEntity>? categories,
    Map<String, List<ProductEntity>>? productsByCategory,
    String? selectedCategoryId,
    String? selectedLocation,
    List<String>? availableLocations,
    int? currentBottomNavTab,
    String? errorMessage,
    Map<String, ProductEntity>? productsById,
  }) {
    return HomeState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      productsByCategory: productsByCategory ?? this.productsByCategory,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      availableLocations: availableLocations ?? this.availableLocations,
      currentBottomNavTab: currentBottomNavTab ?? this.currentBottomNavTab,
      errorMessage: errorMessage,
      productsById: productsById ?? this.productsById,
    );
  }

  @override
  List<Object?> get props => [
    status,
    categories,
    productsByCategory,
    selectedCategoryId,
    selectedLocation,
    availableLocations,
    currentBottomNavTab,
    errorMessage,
    productsById,
  ];
}
