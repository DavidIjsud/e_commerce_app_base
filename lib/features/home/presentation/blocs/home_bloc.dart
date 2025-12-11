import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_events.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_states.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/category.dart';
import 'package:e_commerce_app_base/features/home/presentation/models/food_item.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/config/assets/ecommerce.dart';

/// BLoC for managing home page state
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeInitialized>(_onInitialized);
    on<CategorySelected>(_onCategorySelected);
    on<LocationChanged>(_onLocationChanged);
    on<FoodItemFavoriteToggled>(_onFoodItemFavoriteToggled);
    on<BottomNavTabChanged>(_onBottomNavTabChanged);
  }

  void _onInitialized(
    HomeInitialized event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(status: HomeStatus.loading));

    // Load mock data
    final config = Get.injector<Config>();
    final categories = _loadMockCategories(config);

    // Select first category by default
    final firstCategoryId = categories.isNotEmpty ? categories.first.id : null;

    emit(
      state.copyWith(
        status: HomeStatus.loaded,
        categories: categories,
        selectedCategoryId: firstCategoryId,
      ),
    );
  }

  void _onCategorySelected(
    CategorySelected event,
    Emitter<HomeState> emit,
  ) {
    final updatedCategories = state.categories.map((category) {
      return category.copyWith(
        isSelected: category.id == event.categoryId,
      );
    }).toList();

    emit(
      state.copyWith(
        categories: updatedCategories,
        selectedCategoryId: event.categoryId,
      ),
    );
  }

  void _onLocationChanged(
    LocationChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        selectedLocation: event.location,
      ),
    );
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

    emit(
      state.copyWith(
        categories: updatedCategories,
      ),
    );
  }

  void _onBottomNavTabChanged(
    BottomNavTabChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        currentBottomNavTab: event.tabIndex,
      ),
    );
  }

  /// Load mock categories with items
  /// This will be replaced with API calls in the future
  List<Category> _loadMockCategories(Config config) {
    final assets = config.assets as EcommerceAssets;

    // Create 7 items for each category
    final burgerItems = List.generate(7, (index) {
      return FoodItem(
        id: 'burger_$index',
        name: index == 0
            ? 'Ordinary Burgers'
            : index == 1
                ? 'Burger With Meat'
                : 'Burger ${index + 1}',
        imagePath: assets.homeCategoryItemHamburger,
        rating: 4.9,
        distance: '190m',
        price: '\$ 17,230',
        isFavorite: true,
      );
    });

    final tacoItems = List.generate(7, (index) {
      return FoodItem(
        id: 'taco_$index',
        name: 'Taco ${index + 1}',
        imagePath: assets.homeCategoryItemHamburger, // Using same image for now
        rating: 4.8,
        distance: '200m',
        price: '\$ 15,500',
        isFavorite: false,
      );
    });

    final drinkItems = List.generate(7, (index) {
      return FoodItem(
        id: 'drink_$index',
        name: 'Drink ${index + 1}',
        imagePath: assets.homeCategoryItemHamburger, // Using same image for now
        rating: 4.7,
        distance: '150m',
        price: '\$ 8,000',
        isFavorite: false,
      );
    });

    final pizzaItems = List.generate(7, (index) {
      return FoodItem(
        id: 'pizza_$index',
        name: 'Pizza ${index + 1}',
        imagePath: assets.homeCategoryItemHamburger, // Using same image for now
        rating: 4.9,
        distance: '180m',
        price: '\$ 20,000',
        isFavorite: false,
      );
    });

    return [
      Category(
        id: 'burger',
        name: 'Burger',
        imagePath: assets.homeCategoryHamburger,
        items: burgerItems,
        isSelected: true, // Burger is selected by default
      ),
      Category(
        id: 'taco',
        name: 'Taco',
        imagePath: assets.homeCategoryTaco,
        items: tacoItems,
      ),
      Category(
        id: 'drink',
        name: 'Drink',
        imagePath: assets.homeCategoryDrink,
        items: drinkItems,
      ),
      Category(
        id: 'pizza',
        name: 'Pizza',
        imagePath: assets.homeCategoryPizza,
        items: pizzaItems,
      ),
    ];
  }
}

