import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/cart/domain/entities/cart_item_entity.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_events.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_states.dart';

/// BLoC for managing shopping cart state
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartInitialized>(_onInitialized);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
    on<CartItemQuantityIncremented>(_onQuantityIncremented);
    on<CartItemQuantityDecremented>(_onQuantityDecremented);
    on<CartItemSelectionToggled>(_onSelectionToggled);
    on<CartAllItemsSelectionToggled>(_onAllSelectionToggled);
    on<CartPromoCodeApplied>(_onPromoCodeApplied);
    on<CartPromoCodeRemoved>(_onPromoCodeRemoved);
    on<CartDeliveryLocationChanged>(_onDeliveryLocationChanged);
    on<CartCleared>(_onCleared);
  }

  void _onInitialized(
    CartInitialized event,
    Emitter<CartState> emit,
  ) {
    emit(state.copyWith(status: CartStatus.loaded));
  }

  void _onItemAdded(
    CartItemAdded event,
    Emitter<CartState> emit,
  ) {
    final productId = event.product.id;
    final existingItem = state.items[productId];

    final Map<String, CartItemEntity> updatedItems = Map.from(state.items);
    final Set<String> updatedSelectedIds = Set.from(state.selectedItemIds);

    if (existingItem != null) {
      // Update existing item quantity
      updatedItems[productId] = existingItem.copyWith(
        quantity: existingItem.quantity + event.quantity,
      );
    } else {
      // Add new item
      updatedItems[productId] = CartItemEntity.fromProduct(
        event.product,
        event.quantity,
      );
      // Auto-select newly added items
      updatedSelectedIds.add(productId);
    }

    emit(state.copyWith(
      status: CartStatus.loaded,
      items: updatedItems,
      selectedItemIds: updatedSelectedIds,
    ));
  }

  void _onItemRemoved(
    CartItemRemoved event,
    Emitter<CartState> emit,
  ) {
    final Map<String, CartItemEntity> updatedItems = Map.from(state.items);
    final Set<String> updatedSelectedIds = Set.from(state.selectedItemIds);

    updatedItems.remove(event.productId);
    updatedSelectedIds.remove(event.productId);

    emit(state.copyWith(
      items: updatedItems,
      selectedItemIds: updatedSelectedIds,
    ));
  }

  void _onQuantityIncremented(
    CartItemQuantityIncremented event,
    Emitter<CartState> emit,
  ) {
    final item = state.items[event.productId];
    if (item == null) return;

    final stepQuantity = item.quantityRules?.stepQuantity ?? 1;
    final newQuantity = item.quantity + stepQuantity;

    final Map<String, CartItemEntity> updatedItems = Map.from(state.items);
    updatedItems[event.productId] = item.copyWith(quantity: newQuantity);

    emit(state.copyWith(items: updatedItems));
  }

  void _onQuantityDecremented(
    CartItemQuantityDecremented event,
    Emitter<CartState> emit,
  ) {
    final item = state.items[event.productId];
    if (item == null) return;

    final stepQuantity = item.quantityRules?.stepQuantity ?? 1;
    final minQuantity = item.quantityRules?.minQuantity ?? 1;
    final newQuantity = item.quantity - stepQuantity;

    // If new quantity would be less than min, remove the item
    if (newQuantity < minQuantity) {
      add(CartItemRemoved(event.productId));
      return;
    }

    final Map<String, CartItemEntity> updatedItems = Map.from(state.items);
    updatedItems[event.productId] = item.copyWith(quantity: newQuantity);

    emit(state.copyWith(items: updatedItems));
  }

  void _onSelectionToggled(
    CartItemSelectionToggled event,
    Emitter<CartState> emit,
  ) {
    final Set<String> updatedSelectedIds = Set.from(state.selectedItemIds);

    if (updatedSelectedIds.contains(event.productId)) {
      updatedSelectedIds.remove(event.productId);
    } else {
      updatedSelectedIds.add(event.productId);
    }

    emit(state.copyWith(selectedItemIds: updatedSelectedIds));
  }

  void _onAllSelectionToggled(
    CartAllItemsSelectionToggled event,
    Emitter<CartState> emit,
  ) {
    if (state.allItemsSelected) {
      // Deselect all
      emit(state.copyWith(selectedItemIds: {}));
    } else {
      // Select all
      emit(state.copyWith(selectedItemIds: state.items.keys.toSet()));
    }
  }

  void _onPromoCodeApplied(
    CartPromoCodeApplied event,
    Emitter<CartState> emit,
  ) {
    // Mock promo code validation
    // In a real app, this would call an API to validate
    double discount = 0;
    if (event.promoCode.toUpperCase() == 'DISCOUNT10') {
      discount = 10;
    } else if (event.promoCode.toUpperCase() == 'DISCOUNT20') {
      discount = 20;
    }

    emit(state.copyWith(
      promoCode: event.promoCode,
      promoDiscount: discount,
    ));
  }

  void _onPromoCodeRemoved(
    CartPromoCodeRemoved event,
    Emitter<CartState> emit,
  ) {
    emit(state.copyWith(clearPromoCode: true));
  }

  void _onDeliveryLocationChanged(
    CartDeliveryLocationChanged event,
    Emitter<CartState> emit,
  ) {
    emit(state.copyWith(deliveryLocation: event.location));
  }

  void _onCleared(
    CartCleared event,
    Emitter<CartState> emit,
  ) {
    emit(const CartState(status: CartStatus.loaded));
  }
}
