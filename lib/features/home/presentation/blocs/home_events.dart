import 'package:equatable/equatable.dart';

/// Base class for home events
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Event when home page is initialized
class HomeInitialized extends HomeEvent {
  const HomeInitialized();
}

/// Event when a category is selected
class CategorySelected extends HomeEvent {
  const CategorySelected(this.categoryId);

  final String categoryId;

  @override
  List<Object?> get props => [categoryId];
}

/// Event when location is changed
class LocationChanged extends HomeEvent {
  const LocationChanged(this.location);

  final String location;

  @override
  List<Object?> get props => [location];
}

/// Event when a food item favorite status is toggled
class FoodItemFavoriteToggled extends HomeEvent {
  const FoodItemFavoriteToggled(this.itemId);

  final String itemId;

  @override
  List<Object?> get props => [itemId];
}

/// Event when bottom navigation tab is changed
class BottomNavTabChanged extends HomeEvent {
  const BottomNavTabChanged(this.tabIndex);

  final int tabIndex;

  @override
  List<Object?> get props => [tabIndex];
}

