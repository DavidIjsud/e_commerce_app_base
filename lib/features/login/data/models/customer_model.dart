import 'package:e_commerce_app_base/features/login/domain/entities/customer.dart';

/// Modelo de datos (DTO) para Customer
/// 
/// Extiende la entidad del dominio y añade métodos de serialización
class CustomerModel extends Customer {
  const CustomerModel({
    required super.id,
    required super.email,
    super.firstName,
    super.lastName,
    super.phone,
    super.dateOfBirth,
    super.lastPurchaseDate,
    required super.isCustomerDeleted,
    required super.isActive,
    required super.totalSpent,
    required super.totalOrders,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Crea un CustomerModel desde un JSON
  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['_id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'] as String)
          : null,
      lastPurchaseDate: json['lastPurchaseDate'] != null
          ? DateTime.parse(json['lastPurchaseDate'] as String)
          : null,
      isCustomerDeleted: json['isCustomerDeleted'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      totalSpent: (json['totalSpent'] as num?)?.toDouble() ?? 0.0,
      totalOrders: json['totalOrders'] as int? ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  /// Convierte el modelo a JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (phone != null) 'phone': phone,
      if (dateOfBirth != null) 'dateOfBirth': dateOfBirth!.toIso8601String(),
      if (lastPurchaseDate != null)
        'lastPurchaseDate': lastPurchaseDate!.toIso8601String(),
      'isCustomerDeleted': isCustomerDeleted,
      'isActive': isActive,
      'totalSpent': totalSpent,
      'totalOrders': totalOrders,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Convierte el modelo a entidad del dominio
  Customer toEntity() {
    return Customer(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      dateOfBirth: dateOfBirth,
      lastPurchaseDate: lastPurchaseDate,
      isCustomerDeleted: isCustomerDeleted,
      isActive: isActive,
      totalSpent: totalSpent,
      totalOrders: totalOrders,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

