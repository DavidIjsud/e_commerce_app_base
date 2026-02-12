import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_states.dart';
import 'package:e_commerce_app_base/features/cart/presentation/blocs/cart_events.dart';

/// Promo code input section for the cart page
class CartPromoCodeInput extends StatefulWidget {
  const CartPromoCodeInput({super.key});

  @override
  State<CartPromoCodeInput> createState() => _CartPromoCodeInputState();
}

class _CartPromoCodeInputState extends State<CartPromoCodeInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final assets = config.assets;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        // If promo code is already applied, show it
        if (state.promoCode != null && state.promoCode!.isNotEmpty) {
          _controller.text = state.promoCode!;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: colors.neutral20),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                SvgPicture.asset(
                  assets.porcentageOrangeIcon,
                  width: 24,
                  height: 24,
                  placeholderBuilder: (context) => Icon(
                    Icons.percent,
                    color: colors.primaryHoverIris,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: typography.bodyMediumRegular.copyWith(
                      color: colors.neutral100,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Promo Code...',
                      hintStyle: typography.bodyMediumRegular.copyWith(
                        color: colors.neutral40,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_controller.text.isNotEmpty) {
                      context.read<CartBloc>().add(
                            CartPromoCodeApplied(_controller.text),
                          );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: colors.primaryHoverIris,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Apply',
                      style: typography.bodySmallBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
