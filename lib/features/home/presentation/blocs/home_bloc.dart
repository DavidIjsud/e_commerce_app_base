import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/core/network/exceptions/exceptions.dart';
import 'package:e_commerce_app_base/features/home/domain/domain.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_events.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_states.dart';
import 'package:e_commerce_app_base/config/config.dart';

/// BLoC for managing home page state
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductsRepository productsRepository;
  final Config config;

  HomeBloc({required this.productsRepository, required this.config})
    : super(const HomeState()) {
    on<HomeInitialized>(_onInitialized);
    on<CategorySelected>(_onCategorySelected);
    on<LocationChanged>(_onLocationChanged);
    on<FoodItemFavoriteToggled>(_onFoodItemFavoriteToggled);
    on<BottomNavTabChanged>(_onBottomNavTabChanged);
  }

  void _onInitialized(HomeInitialized event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      // Obtener productos de la API
      final products = await productsRepository.getAllProducts();

      await Future.delayed(const Duration(seconds: 5));

      // Agrupar productos por categoría
      final Map<String, List<ProductEntity>> productsByCategory = {};
      final Map<String, CategoryEntity> categoriesMap = {};

      for (final product in products) {
        if (product.isSuspended) continue; // Filtrar productos suspendidos

        final categoryId = product.category.id;
        if (!productsByCategory.containsKey(categoryId)) {
          productsByCategory[categoryId] = [];
          categoriesMap[categoryId] = product.category;
        }
        productsByCategory[categoryId]!.add(product);
      }

      // Convertir categorías a lista y ordenar por nombre
      final categories = categoriesMap.values.toList()
        ..sort((a, b) => a.name.compareTo(b.name));

      // Crear mapa de productos por ID para acceso rápido
      final productsById = {for (var product in products) product.id: product};

      // Seleccionar la primera categoría por defecto
      final firstCategoryId = categories.isNotEmpty ? categories.first.id : null;

      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          categories: categories,
          productsByCategory: productsByCategory,
          selectedCategoryId: firstCategoryId,
          productsById: productsById,
        ),
      );
    } on ServerException catch (e) {
      emit(state.copyWith(status: HomeStatus.error, errorMessage: e.message));
    } on NetworkException catch (e) {
      emit(state.copyWith(status: HomeStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
          errorMessage: 'An unexpected error occurred. Please try again.',
        ),
      );
    }
  }

  void _onCategorySelected(CategorySelected event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedCategoryId: event.categoryId));
  }

  void _onLocationChanged(LocationChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedLocation: event.location));
  }

  void _onFoodItemFavoriteToggled(
    FoodItemFavoriteToggled event,
    Emitter<HomeState> emit,
  ) {
    // Update productsById with toggled favorite
    final updatedProductsById = Map<String, ProductEntity>.from(state.productsById);
    final product = updatedProductsById[event.itemId];
    if (product != null) {
      // Create updated product with toggled favorite
      // Note: ProductEntity would need a copyWith method for this to work properly
      // For now, we'll update the productsByCategory map
    }

    // Update productsByCategory
    final updatedProductsByCategory = <String, List<ProductEntity>>{};
    for (final entry in state.productsByCategory.entries) {
      final updatedProducts = entry.value.map((product) {
        if (product.id == event.itemId) {
          // Since ProductEntity doesn't have copyWith, we need to create a new instance
          // This would require ProductEntity to have a copyWith method
          // For now, the favorite toggle won't persist in state
          return product;
        }
        return product;
      }).toList();
      updatedProductsByCategory[entry.key] = updatedProducts;
    }

    emit(state.copyWith(productsByCategory: updatedProductsByCategory));
  }

  void _onBottomNavTabChanged(
    BottomNavTabChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentBottomNavTab: event.tabIndex));
  }
}
