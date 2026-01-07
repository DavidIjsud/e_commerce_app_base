import 'package:equatable/equatable.dart';

/// Base class for product detail events
abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object?> get props => [];
}

/// Event fired when the product detail page is initialized
class ProductDetailInitialized extends ProductDetailEvent {
  const ProductDetailInitialized();
}

/// Event fired when the quantity is incremented
class ProductDetailQuantityIncremented extends ProductDetailEvent {
  const ProductDetailQuantityIncremented();
}

/// Event fired when the quantity is decremented
class ProductDetailQuantityDecremented extends ProductDetailEvent {
  const ProductDetailQuantityDecremented();
}

/// Event fired when the favorite status is toggled
class ProductDetailFavoriteToggled extends ProductDetailEvent {
  const ProductDetailFavoriteToggled();
}

/// Event fired when the image carousel page changes
class ProductDetailImagePageChanged extends ProductDetailEvent {
  final int pageIndex;

  const ProductDetailImagePageChanged(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}

