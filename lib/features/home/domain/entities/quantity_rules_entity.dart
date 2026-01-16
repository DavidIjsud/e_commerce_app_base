/// Entidad QuantityRules del dominio
///
/// Representa las reglas de cantidad para un producto en la capa de dominio
class QuantityRulesEntity {
  final num minQuantity;
  final num stepQuantity;
  final bool allowDecimal;
  final String? mongoId;
  final String? id;

  const QuantityRulesEntity({
    required this.minQuantity,
    required this.stepQuantity,
    required this.allowDecimal,
    this.mongoId,
    this.id,
  });
}
