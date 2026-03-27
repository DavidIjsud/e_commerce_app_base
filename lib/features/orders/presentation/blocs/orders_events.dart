import 'package:equatable/equatable.dart';

/// Base class for orders events
abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when the orders screen is first mounted
class OrdersInitialized extends OrdersEvent {
  const OrdersInitialized();
}
