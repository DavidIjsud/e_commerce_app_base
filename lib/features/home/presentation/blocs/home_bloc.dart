import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/core/network/exceptions/exceptions.dart';
import 'package:e_commerce_app_base/features/home/domain/domain.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_events.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_states.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/category_view_model.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/food_item_view_model.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/config/assets/ecommerce.dart';

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

      // Convertir productos a categorías con items
      final categories = _mapProductsToCategories(products);

      // Seleccionar la primera categoría por defecto
      final firstCategoryId = categories.isNotEmpty
          ? categories.first.id
          : null;

      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          categories: categories,
          selectedCategoryId: firstCategoryId,
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
    final updatedCategories = state.categories.map((category) {
      return category.copyWith(isSelected: category.id == event.categoryId);
    }).toList();

    emit(
      state.copyWith(
        categories: updatedCategories,
        selectedCategoryId: event.categoryId,
      ),
    );
  }

  void _onLocationChanged(LocationChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedLocation: event.location));
  }

  void _onFoodItemFavoriteToggled(
    FoodItemFavoriteToggled event,
    Emitter<HomeState> emit,
  ) {
    final updatedCategories = state.categories.map((category) {
      final updatedItems = category.items.map((item) {
        if (item.id == event.itemId) {
          return item.copyWith(isFavorite: !item.isFavorite);
        }
        return item;
      }).toList();

      return category.copyWith(items: updatedItems);
    }).toList();

    emit(state.copyWith(categories: updatedCategories));
  }

  void _onBottomNavTabChanged(
    BottomNavTabChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentBottomNavTab: event.tabIndex));
  }

  /// Mapea productos de la API a categorías con items
  List<CategoryViewModel> _mapProductsToCategories(
    List<ProductEntity> products,
  ) {
    final assets = config.assets as EcommerceAssets;

    // Agrupar productos por categoría
    final Map<String, List<ProductEntity>> productsByCategory = {};
    for (final product in products) {
      final categoryId = product.category.id;
      if (!productsByCategory.containsKey(categoryId)) {
        productsByCategory[categoryId] = [];
      }
      productsByCategory[categoryId]!.add(product);
    }

    // Convertir a lista de CategoryViewModel
    final categories = <CategoryViewModel>[];
    for (final entry in productsByCategory.entries) {
      final categoryProducts = entry.value;
      if (categoryProducts.isEmpty) continue;

      final firstProduct = categoryProducts.first;
      final categoryEntity = firstProduct.category;

      // Mapear productos a FoodItems
      final foodItems = categoryProducts
          .where((p) => !p.isSuspended) // Filtrar productos suspendidos
          .map((product) => _mapProductToFoodItem(product, assets))
          .toList();

      if (foodItems.isEmpty) continue;

      // Obtener icono de categoría (hardcoded por nombre)
      final categoryIcon = _getCategoryIcon(categoryEntity.name, assets);

      categories.add(
        CategoryViewModel(
          id: categoryEntity.id,
          name: categoryEntity.name,
          imagePath: categoryIcon,
          items: foodItems,
          isSelected: false, // Se seleccionará la primera después
        ),
      );
    }

    // Ordenar categorías por nombre
    categories.sort((a, b) => a.name.compareTo(b.name));

    // Seleccionar la primera categoría
    if (categories.isNotEmpty) {
      categories[0] = categories[0].copyWith(isSelected: true);
    }

    return categories;
  }

  /// Mapea un ProductEntity a FoodItemViewModel
  FoodItemViewModel _mapProductToFoodItem(
    ProductEntity product,
    EcommerceAssets assets,
  ) {
    // Campos que vienen de la API
    final name = product.productName;
    final price = product.priceWithDiscount;

    // Campos hardcodeados (no vienen en la respuesta)
    final rating = 4.5; // Hardcoded
    final distance = '150m'; // Hardcoded
    final isFavorite = product.isFavorite;
    final imagePath = product.image.isNotEmpty
        ? product.image
        : assets.homeCategoryItemHamburger; // Fallback si no hay imagen

    // Formatear precio
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

  /// Obtiene el icono de categoría basado en el nombre
  String _getCategoryIcon(String categoryName, EcommerceAssets assets) {
    final name = categoryName.toLowerCase();
    if (name.contains('bebida') || name.contains('drink')) {
      return assets.homeCategoryDrink;
    } else if (name.contains('hamburger') || name.contains('burger')) {
      return assets.homeCategoryHamburger;
    } else if (name.contains('taco')) {
      return assets.homeCategoryTaco;
    } else if (name.contains('pizza')) {
      return assets.homeCategoryPizza;
    }
    // Fallback: usar icono de hamburger por defecto
    return assets.homeCategoryHamburger;
  }
}
