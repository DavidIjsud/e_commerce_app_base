import 'package:e_commerce_app_base/features/home/domain/entities/quantity_rules_entity.dart';

/// Data Transfer Object (DTO) para QuantityRules
class QuantityRulesDTO extends QuantityRulesEntity {
  const QuantityRulesDTO({
    required super.minQuantity,
    required super.stepQuantity,
    required super.allowDecimal,
    super.mongoId,
    super.id,
  });

  /// Crea un QuantityRulesDTO desde un JSON
  factory QuantityRulesDTO.fromJson(Map<String, dynamic> json) {
    return QuantityRulesDTO(
      minQuantity: json['minQuantity'] as num? ?? 1,
      stepQuantity: json['stepQuantity'] as num? ?? 1,
      allowDecimal: json['allowDecimal'] as bool? ?? false,
      mongoId: json['_id'] as String?,
      id: json['id'] as String?,
    );
  }

  /// Convierte el DTO a JSON
  Map<String, dynamic> toJson() {
    return {
      'minQuantity': minQuantity,
      'stepQuantity': stepQuantity,
      'allowDecimal': allowDecimal,
      if (mongoId != null) '_id': mongoId,
      if (id != null) 'id': id,
    };
  }

  /// Convierte el DTO a entidad del dominio
  QuantityRulesEntity toEntity() {
    return QuantityRulesEntity(
      minQuantity: minQuantity,
      stepQuantity: stepQuantity,
      allowDecimal: allowDecimal,
      mongoId: mongoId,
      id: id,
    );
  }
}
