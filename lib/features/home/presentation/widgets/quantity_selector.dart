import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';

/// Quantity selector widget
///
/// Allows users to increment or decrement the quantity
class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;

    return Row(
      children: [
        // Decrement button
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors.neutral20,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.remove,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Quantity display
        Text(
          quantity.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        // Increment button
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors.primaryHoverIris,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

