import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/orders/domain/entities/order_entity.dart';

enum OrdersStatus { initial, loading, loaded, error }

/// State for the orders list
class OrdersState extends Equatable {
  const OrdersState({
    this.status = OrdersStatus.initial,
    this.orders = const [],
    this.errorMessage,
  });

  final OrdersStatus status;
  final List<OrderEntity> orders;
  final String? errorMessage;

  OrdersState copyWith({
    OrdersStatus? status,
    List<OrderEntity>? orders,
    String? errorMessage,
  }) {
    return OrdersState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, orders, errorMessage];
}
