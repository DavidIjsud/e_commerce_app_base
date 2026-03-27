import 'package:equatable/equatable.dart';

/// Order lifecycle status
enum OrderStatus {
  pending,
  confirmed,
  shipped,
  delivered,
  cancelled;

  static OrderStatus fromString(String value) {
    return OrderStatus.values.firstWhere(
      (s) => s.name == value,
      orElse: () => OrderStatus.pending,
    );
  }
}

/// Payment lifecycle status
enum PaymentStatus {
  pending,
  paid,
  failed,
  refunded;

  static PaymentStatus fromString(String value) {
    return PaymentStatus.values.firstWhere(
      (s) => s.name == value,
      orElse: () => PaymentStatus.pending,
    );
  }
}

/// A single product line inside an order
class OrderProductEntity extends Equatable {
  const OrderProductEntity({
    required this.id,
    required this.productId,
    required this.productName,
    this.note,
    required this.quantity,
    required this.unitPrice,
    required this.discountPercentage,
    required this.totalOfProductToPay,
  });

  final String id;
  final String productId;
  final String productName;
  final String? note;
  final int quantity;
  final double unitPrice;
  final double discountPercentage;
  final double totalOfProductToPay;

  @override
  List<Object?> get props => [
        id,
        productId,
        productName,
        note,
        quantity,
        unitPrice,
        discountPercentage,
        totalOfProductToPay,
      ];
}

/// Represents a single user order
class OrderEntity extends Equatable {
  const OrderEntity({
    required this.id,
    required this.status,
    required this.paymentStatus,
    required this.products,
    required this.subTotal,
    required this.totalAmount,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final OrderStatus status;
  final PaymentStatus paymentStatus;
  final List<OrderProductEntity> products;
  final double subTotal;
  final double totalAmount;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        status,
        paymentStatus,
        products,
        subTotal,
        totalAmount,
        notes,
        createdAt,
        updatedAt,
      ];
}
