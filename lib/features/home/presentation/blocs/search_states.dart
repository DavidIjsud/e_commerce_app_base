import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/food_item_view_model.dart';

enum SearchStatus { initial, searching, loaded, empty, error }

class SearchState extends Equatable {
  const SearchState({
    this.status = SearchStatus.initial,
    this.searchQuery = '',
    this.searchResults = const [],
    this.allProducts = const [],
    this.categories = const [],
    this.selectedCategoryId,
    this.minPrice,
    this.maxPrice,
    this.errorMessage,
  });

  final SearchStatus status;
  final String searchQuery;
  final List<FoodItemViewModel> searchResults;
  final List<ProductEntity> allProducts;
  final List<CategoryEntity> categories;
  final String? selectedCategoryId;
  final double? minPrice;
  final double? maxPrice;
  final String? errorMessage;

  bool get isLoading => status == SearchStatus.searching;
  bool get hasResults => searchResults.isNotEmpty;
  bool get hasFilters =>
      selectedCategoryId != null || minPrice != null || maxPrice != null;
  int get totalResultsCount => searchResults.length;

  @override
  List<Object?> get props => [
        status,
        searchQuery,
        searchResults,
        allProducts,
        categories,
        selectedCategoryId,
        minPrice,
        maxPrice,
        errorMessage,
      ];

  SearchState copyWith({
    SearchStatus? status,
    String? searchQuery,
    List<FoodItemViewModel>? searchResults,
    List<ProductEntity>? allProducts,
    List<CategoryEntity>? categories,
    String? selectedCategoryId,
    double? minPrice,
    double? maxPrice,
    String? errorMessage,
    bool clearCategory = false,
    bool clearMinPrice = false,
    bool clearMaxPrice = false,
  }) {
    return SearchState(
      status: status ?? this.status,
      searchQuery: searchQuery ?? this.searchQuery,
      searchResults: searchResults ?? this.searchResults,
      allProducts: allProducts ?? this.allProducts,
      categories: categories ?? this.categories,
      selectedCategoryId:
          clearCategory ? null : (selectedCategoryId ?? this.selectedCategoryId),
      minPrice: clearMinPrice ? null : (minPrice ?? this.minPrice),
      maxPrice: clearMaxPrice ? null : (maxPrice ?? this.maxPrice),
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
