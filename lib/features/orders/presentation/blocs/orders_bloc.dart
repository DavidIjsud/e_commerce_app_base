import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/orders/domain/entities/order_entity.dart';
import 'package:e_commerce_app_base/features/orders/presentation/blocs/orders_events.dart';
import 'package:e_commerce_app_base/features/orders/presentation/blocs/orders_states.dart';

/// BLoC for managing the orders list state.
///
/// Uses fake data for now. Designed to be replaced with real API calls.
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(const OrdersState()) {
    on<OrdersInitialized>(_onInitialized);
  }

  void _onInitialized(
    OrdersInitialized event,
    Emitter<OrdersState> emit,
  ) {
    emit(state.copyWith(status: OrdersStatus.loading));

    emit(state.copyWith(
      status: OrdersStatus.loaded,
      orders: _fakeOrders,
    ));
  }

  static final List<OrderEntity> _fakeOrders = [
    OrderEntity(
      id: '68bf81986bdc6cea0699d017',
      status: OrderStatus.confirmed,
      paymentStatus: PaymentStatus.pending,
      products: [
        const OrderProductEntity(
          id: '0',
          productId: '68ae5f4d5391b7a7124716d6',
          productName: 'Nuez',
          note: 'Por favor, que no esten negras',
          quantity: 1,
          unitPrice: 20,
          discountPercentage: 10,
          totalOfProductToPay: 18,
        ),
        const OrderProductEntity(
          id: '1',
          productId: '68ae675b5391b7a7124716d9',
          productName: 'Carne de primera',
          quantity: 1,
          unitPrice: 5,
          discountPercentage: 0,
          totalOfProductToPay: 5,
        ),
      ],
      subTotal: 23,
      totalAmount: 23,
      notes: 'Mejor si la entrega es por la mañana, gracias.',
      createdAt: DateTime.parse('2025-09-01T01:23:36.464Z'),
      updatedAt: DateTime.parse('2025-09-09T02:53:49.496Z'),
    ),
    OrderEntity(
      id: '68bf81986bdc6cea0699d018',
      status: OrderStatus.delivered,
      paymentStatus: PaymentStatus.paid,
      products: [
        const OrderProductEntity(
          id: '0',
          productId: '68ae5f4d5391b7a7124716d7',
          productName: 'Manzana Roja',
          quantity: 3,
          unitPrice: 8,
          discountPercentage: 0,
          totalOfProductToPay: 24,
        ),
      ],
      subTotal: 24,
      totalAmount: 24,
      createdAt: DateTime.parse('2025-08-15T10:00:00.000Z'),
      updatedAt: DateTime.parse('2025-08-20T14:30:00.000Z'),
    ),
    OrderEntity(
      id: '68bf81986bdc6cea0699d019',
      status: OrderStatus.shipped,
      paymentStatus: PaymentStatus.paid,
      products: [
        const OrderProductEntity(
          id: '0',
          productId: '68ae5f4d5391b7a7124716d8',
          productName: 'Aguacate Hass',
          quantity: 2,
          unitPrice: 12,
          discountPercentage: 5,
          totalOfProductToPay: 22.8,
        ),
        const OrderProductEntity(
          id: '1',
          productId: '68ae5f4d5391b7a7124716d9',
          productName: 'Limón Persa',
          quantity: 5,
          unitPrice: 3,
          discountPercentage: 0,
          totalOfProductToPay: 15,
        ),
      ],
      subTotal: 37.8,
      totalAmount: 37.8,
      createdAt: DateTime.parse('2025-09-10T08:45:00.000Z'),
      updatedAt: DateTime.parse('2025-09-11T09:00:00.000Z'),
    ),
    OrderEntity(
      id: '68bf81986bdc6cea0699d020',
      status: OrderStatus.cancelled,
      paymentStatus: PaymentStatus.refunded,
      products: [
        const OrderProductEntity(
          id: '0',
          productId: '68ae5f4d5391b7a7124716da',
          productName: 'Queso Manchego',
          quantity: 1,
          unitPrice: 35,
          discountPercentage: 0,
          totalOfProductToPay: 35,
        ),
      ],
      subTotal: 35,
      totalAmount: 35,
      notes: 'Cancelado por el cliente.',
      createdAt: DateTime.parse('2025-07-20T16:00:00.000Z'),
      updatedAt: DateTime.parse('2025-07-21T10:00:00.000Z'),
    ),
    OrderEntity(
      id: '68bf81986bdc6cea0699d021',
      status: OrderStatus.pending,
      paymentStatus: PaymentStatus.pending,
      products: [
        const OrderProductEntity(
          id: '0',
          productId: '68ae5f4d5391b7a7124716db',
          productName: 'Yogur Natural',
          quantity: 4,
          unitPrice: 6,
          discountPercentage: 0,
          totalOfProductToPay: 24,
        ),
      ],
      subTotal: 24,
      totalAmount: 24,
      createdAt: DateTime.parse('2025-09-12T11:30:00.000Z'),
      updatedAt: DateTime.parse('2025-09-12T11:30:00.000Z'),
    ),
  ];
}
