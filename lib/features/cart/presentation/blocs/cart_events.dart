import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';

/// Base class for cart events
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

/// Initialize cart
class CartInitialized extends CartEvent {
  const CartInitialized();
}

/// Add a product to cart
class CartItemAdded extends CartEvent {
  const CartItemAdded({
    required this.product,
    required this.quantity,
  });

  final ProductEntity product;
  final num quantity;

  @override
  List<Object?> get props => [product, quantity];
}

/// Remove item from cart entirely
class CartItemRemoved extends CartEvent {
  const CartItemRemoved(this.productId);

  final String productId;

  @override
  List<Object?> get props => [productId];
}

/// Increment quantity of an item
class CartItemQuantityIncremented extends CartEvent {
  const CartItemQuantityIncremented(this.productId);

  final String productId;

  @override
  List<Object?> get props => [productId];
}

/// Decrement quantity of an item
class CartItemQuantityDecremented extends CartEvent {
  const CartItemQuantityDecremented(this.productId);

  final String productId;

  @override
  List<Object?> get props => [productId];
}

/// Toggle item selection (checkbox)
class CartItemSelectionToggled extends CartEvent {
  const CartItemSelectionToggled(this.productId);

  final String productId;

  @override
  List<Object?> get props => [productId];
}

/// Select/deselect all items
class CartAllItemsSelectionToggled extends CartEvent {
  const CartAllItemsSelectionToggled();
}

/// Apply promo code
class CartPromoCodeApplied extends CartEvent {
  const CartPromoCodeApplied(this.promoCode);

  final String promoCode;

  @override
  List<Object?> get props => [promoCode];
}

/// Remove promo code
class CartPromoCodeRemoved extends CartEvent {
  const CartPromoCodeRemoved();
}

/// Update delivery location
class CartDeliveryLocationChanged extends CartEvent {
  const CartDeliveryLocationChanged(this.location);

  final String location;

  @override
  List<Object?> get props => [location];
}

/// Clear entire cart
class CartCleared extends CartEvent {
  const CartCleared();
}
