/// Entidad Customer del dominio
/// 
/// Representa un cliente en la capa de dominio
/// No debe contener lógica de serialización/deserialización
class Customer {
  final String id;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final DateTime? dateOfBirth;
  final DateTime? lastPurchaseDate;
  final bool isCustomerDeleted;
  final bool isActive;
  final double totalSpent;
  final int totalOrders;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Customer({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.dateOfBirth,
    this.lastPurchaseDate,
    required this.isCustomerDeleted,
    required this.isActive,
    required this.totalSpent,
    required this.totalOrders,
    required this.createdAt,
    required this.updatedAt,
  });

  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    return firstName ?? lastName ?? email;
  }
}

