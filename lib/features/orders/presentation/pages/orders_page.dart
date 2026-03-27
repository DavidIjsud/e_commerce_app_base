import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/orders/presentation/blocs/blocs.dart';
import 'package:e_commerce_app_base/features/orders/presentation/widgets/widgets.dart';

/// Entry-point widget for the Orders tab.
///
/// Dispatches [OrdersInitialized] on first mount and renders the orders list.
class OrdersPageContent extends StatefulWidget {
  const OrdersPageContent({super.key});

  @override
  State<OrdersPageContent> createState() => _OrdersPageContentState();
}

class _OrdersPageContentState extends State<OrdersPageContent> {
  @override
  void initState() {
    super.initState();
    context.read<OrdersBloc>().add(const OrdersInitialized());
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),

          // ── Title ─────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Orders',
              textAlign: TextAlign.center,
              style: typography.heading5Bold.copyWith(
                color: colors.neutral100,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Divider(color: colors.neutral30, thickness: 1),

          // ── Content ───────────────────────────────────────────────────
          Expanded(
            child: BlocBuilder<OrdersBloc, OrdersState>(
              builder: (context, state) {
                if (state.status == OrdersStatus.loading ||
                    state.status == OrdersStatus.initial) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: colors.primaryHoverIris,
                    ),
                  );
                }

                if (state.status == OrdersStatus.error) {
                  return Center(
                    child: Text(
                      state.errorMessage ?? 'Something went wrong.',
                      style: typography.bodyMediumRegular.copyWith(
                        color: colors.neutral60,
                      ),
                    ),
                  );
                }

                if (state.orders.isEmpty) {
                  return _EmptyOrdersPlaceholder(
                    colors: colors,
                    typography: typography,
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: state.orders.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 0),
                  itemBuilder: (context, index) {
                    return OrderCard(order: state.orders[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyOrdersPlaceholder extends StatelessWidget {
  const _EmptyOrdersPlaceholder({
    required this.colors,
    required this.typography,
  });

  final dynamic colors;
  final dynamic typography;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 72,
            color: colors.neutral40,
          ),
          const SizedBox(height: 16),
          Text(
            'No orders yet',
            style: typography.heading6Bold.copyWith(color: colors.neutral70),
          ),
          const SizedBox(height: 8),
          Text(
            'Your completed orders will appear here.',
            style: typography.bodyMediumRegular.copyWith(
              color: colors.neutral50,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
