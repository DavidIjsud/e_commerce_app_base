import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/cart/domain/entities/cart_item_entity.dart';

/// Status of the cart
enum CartStatus { initial, loading, loaded, error }

/// State for the cart
class CartState extends Equatable {
  const CartState({
    this.status = CartStatus.initial,
    this.items = const {},
    this.selectedItemIds = const {},
    this.promoCode,
    this.promoDiscount = 0,
    this.deliveryFee = 0,
    this.deliveryLocation = 'Home',
    this.availableLocations = const ['Home', 'Office', 'Other'],
    this.errorMessage,
  });

  final CartStatus status;
  final Map<String, CartItemEntity> items;
  final Set<String> selectedItemIds;
  final String? promoCode;
  final double promoDiscount;
  final double deliveryFee;
  final String deliveryLocation;
  final List<String> availableLocations;
  final String? errorMessage;

  /// Total number of items in cart (sum of quantities)
  int get totalItemsCount =>
      items.values.fold(0, (sum, item) => sum + item.quantity.toInt());

  /// Number of selected items
  int get selectedItemsCount => selectedItemIds.length;

  /// Subtotal of selected items
  double get subtotal => items.entries
      .where((e) => selectedItemIds.contains(e.key))
      .fold(0.0, (sum, e) => sum + e.value.totalPrice);

  /// Discount amount based on promo code
  double get discountAmount => subtotal * (promoDiscount / 100);

  /// Final total
  double get total => subtotal + deliveryFee - discountAmount;

  /// Check if all items are selected
  bool get allItemsSelected =>
      items.isNotEmpty && selectedItemIds.length == items.length;

  /// Check if cart has items
  bool get hasItems => items.isNotEmpty;

  /// Check if there are selected items
  bool get hasSelectedItems => selectedItemIds.isNotEmpty;

  /// Get quantity for a specific product (used by FoodItemCard)
  num getQuantityForProduct(String productId) {
    return items[productId]?.quantity ?? 0;
  }

  /// Check if a product is in the cart
  bool isProductInCart(String productId) {
    return items.containsKey(productId);
  }

  CartState copyWith({
    CartStatus? status,
    Map<String, CartItemEntity>? items,
    Set<String>? selectedItemIds,
    String? promoCode,
    double? promoDiscount,
    double? deliveryFee,
    String? deliveryLocation,
    List<String>? availableLocations,
    String? errorMessage,
    bool clearPromoCode = false,
  }) {
    return CartState(
      status: status ?? this.status,
      items: items ?? this.items,
      selectedItemIds: selectedItemIds ?? this.selectedItemIds,
      promoCode: clearPromoCode ? null : (promoCode ?? this.promoCode),
      promoDiscount: clearPromoCode ? 0 : (promoDiscount ?? this.promoDiscount),
      deliveryFee: deliveryFee ?? this.deliveryFee,
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
      availableLocations: availableLocations ?? this.availableLocations,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        items,
        selectedItemIds,
        promoCode,
        promoDiscount,
        deliveryFee,
        deliveryLocation,
        availableLocations,
        errorMessage,
      ];
}
