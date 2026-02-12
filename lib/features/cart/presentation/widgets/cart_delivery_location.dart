import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_states.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_events.dart';

/// Delivery location section for the cart page
class CartDeliveryLocation extends StatelessWidget {
  const CartDeliveryLocation({super.key});

  void _showLocationPicker(BuildContext context, CartState state) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomSheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Delivery Location',
                style: typography.heading6Bold.copyWith(
                  color: colors.neutral100,
                ),
              ),
              const SizedBox(height: 16),
              ...state.availableLocations.map((location) {
                final isSelected = location == state.deliveryLocation;
                return ListTile(
                  title: Text(
                    location,
                    style: typography.bodyMediumMedium.copyWith(
                      color: isSelected
                          ? colors.primaryHoverIris
                          : colors.neutral100,
                    ),
                  ),
                  trailing: isSelected
                      ? Icon(Icons.check, color: colors.primaryHoverIris)
                      : null,
                  onTap: () {
                    context.read<CartBloc>().add(
                          CartDeliveryLocationChanged(location),
                        );
                    Navigator.pop(bottomSheetContext);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Location',
                    style: typography.bodySmallRegular.copyWith(
                      color: colors.neutral60,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    state.deliveryLocation,
                    style: typography.bodyMediumBold.copyWith(
                      color: colors.neutral100,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => _showLocationPicker(context, state),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: colors.primaryHoverIris),
                  ),
                ),
                child: Text(
                  'Change Location',
                  style: typography.bodySmallMedium.copyWith(
                    color: colors.primaryHoverIris,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
