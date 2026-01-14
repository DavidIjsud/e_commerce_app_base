import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/core/network/exceptions/exceptions.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce_app_base/features/home/domain/repositories/products_repository.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/search_events.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/search_states.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/food_item_view_model.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.productsRepository}) : super(const SearchState()) {
    on<SearchInitialized>(_onSearchInitialized);
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<SearchFilterApplied>(_onSearchFilterApplied);
    on<SearchFilterReset>(_onSearchFilterReset);
  }

  final ProductsRepository productsRepository;

  Timer? _debounce;

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }

  Future<void> _onSearchInitialized(
    SearchInitialized event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(status: SearchStatus.searching));

    try {
      // Load products from repository
      final products = await productsRepository.getAllProducts();

      // Extract unique categories from products
      final categoriesMap = <String, CategoryEntity>{};
      for (final product in products) {
        if (!categoriesMap.containsKey(product.category.id)) {
          categoriesMap[product.category.id] = product.category;
        }
      }
      final categories = categoriesMap.values.toList();

      emit(
        state.copyWith(
          status: SearchStatus.initial,
          allProducts: products,
          categories: categories,
        ),
      );
    } on ServerException catch (e) {
      emit(state.copyWith(status: SearchStatus.error, errorMessage: e.message));
    } on NetworkException catch (e) {
      emit(state.copyWith(status: SearchStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(
        state.copyWith(
          status: SearchStatus.error,
          errorMessage: 'Failed to load products',
        ),
      );
    }
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    _debounce?.cancel();

    emit(
      state.copyWith(searchQuery: event.query, status: SearchStatus.searching),
    );

    // Create a completer to await the debounce timer
    final completer = Completer<void>();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (!emit.isDone) {
        _performSearch(emit, event.query);
      }
      completer.complete();
    });

    // Await the timer to ensure the event handler doesn't complete before the search
    await completer.future;
  }

  void _onSearchFilterApplied(
    SearchFilterApplied event,
    Emitter<SearchState> emit,
  ) {
    emit(
      state.copyWith(
        status: SearchStatus.searching,
        selectedCategoryId: event.categoryId,
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
      ),
    );

    _performSearch(emit, state.searchQuery);
  }

  void _onSearchFilterReset(
    SearchFilterReset event,
    Emitter<SearchState> emit,
  ) {
    emit(
      state.copyWith(
        status: SearchStatus.searching,
        clearCategory: true,
        clearMinPrice: true,
        clearMaxPrice: true,
      ),
    );

    _performSearch(emit, state.searchQuery);
  }

  void _performSearch(Emitter<SearchState> emit, String query) {
    try {
      final trimmedQuery = query.trim().toLowerCase();

      // If query is empty and no filters, show initial state
      if (trimmedQuery.isEmpty && !state.hasFilters) {
        emit(state.copyWith(status: SearchStatus.initial, searchResults: []));
        return;
      }

      // Filter products
      List<ProductEntity> filteredProducts = state.allProducts;

      // Apply filters first
      filteredProducts = _applyFilters(
        filteredProducts,
        state.selectedCategoryId,
        state.minPrice,
        state.maxPrice,
      );

      // Then apply search query
      if (trimmedQuery.isNotEmpty) {
        final productsWithScores = filteredProducts
            .map(
              (product) =>
                  MapEntry(product, _calculateRelevance(product, trimmedQuery)),
            )
            .where((entry) => entry.value > 0)
            .toList();

        // Sort by relevance score (highest first)
        productsWithScores.sort((a, b) => b.value.compareTo(a.value));

        filteredProducts = productsWithScores.map((e) => e.key).toList();
      }

      // Convert to FoodItemViewModel
      final results = filteredProducts
          .map((product) => _mapProductToFoodItem(product))
          .toList();

      emit(
        state.copyWith(
          status: results.isEmpty ? SearchStatus.empty : SearchStatus.loaded,
          searchResults: results,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SearchStatus.error,
          errorMessage: 'Failed to search products',
        ),
      );
    }
  }

  List<ProductEntity> _applyFilters(
    List<ProductEntity> products,
    String? categoryId,
    double? minPrice,
    double? maxPrice,
  ) {
    return products.where((product) {
      // Filter out suspended products
      if (product.isSuspended) return false;

      // Category filter
      if (categoryId != null && product.category.id != categoryId) {
        return false;
      }

      // Price filters
      final price = product.priceWithDiscount;
      if (minPrice != null && price < minPrice) return false;
      if (maxPrice != null && price > maxPrice) return false;

      return true;
    }).toList();
  }

  int _calculateRelevance(ProductEntity product, String query) {
    final lowerQuery = query.toLowerCase();
    int score = 0;

    // Product name match (highest priority)
    if (product.productName.toLowerCase().contains(lowerQuery)) {
      score += 100;
      // Exact match bonus
      if (product.productName.toLowerCase() == lowerQuery) {
        score += 50;
      }
    }

    // Tags match (high priority)
    if (product.tags.any((tag) => tag.toLowerCase().contains(lowerQuery))) {
      score += 50;
    }

    // Description match (medium priority)
    if (product.description.toLowerCase().contains(lowerQuery)) {
      score += 25;
    }

    // Detail match (low priority)
    if (product.detailOfProduct.toLowerCase().contains(lowerQuery)) {
      score += 10;
    }

    return score;
  }

  FoodItemViewModel _mapProductToFoodItem(ProductEntity product) {
    final name = product.productName;
    final price = product.priceWithDiscount;
    final rating = 4.5; // Hardcoded
    final distance = '150m'; // Hardcoded
    final isFavorite = product.isFavorite;

    // Use first image or empty string (will fallback in widget)
    final imagePath = product.firstImageUrl;

    final formattedPrice = '\$ ${price.toStringAsFixed(2)}';

    return FoodItemViewModel(
      id: product.id,
      name: name,
      imagePath: imagePath,
      rating: rating,
      distance: distance,
      price: formattedPrice,
      isFavorite: isFavorite,
    );
  }
}
