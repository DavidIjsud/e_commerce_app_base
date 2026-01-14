import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/search_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/search_events.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

class SearchFilterBottomSheet extends StatefulWidget {
  const SearchFilterBottomSheet({super.key});

  @override
  State<SearchFilterBottomSheet> createState() =>
      _SearchFilterBottomSheetState();
}

class _SearchFilterBottomSheetState extends State<SearchFilterBottomSheet> {
  String? selectedCategoryId;
  double? minPrice;
  double? maxPrice;

  @override
  void initState() {
    super.initState();
    // Initialize with current filter values from SearchBloc
    final searchState = context.read<SearchBloc>().state;
    selectedCategoryId = searchState.selectedCategoryId;
    minPrice = searchState.minPrice;
    maxPrice = searchState.maxPrice;
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    final searchState = context.read<SearchBloc>().state;
    final categories = searchState.categories;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.search_filter_title,
                    style: typography.heading5Bold.copyWith(
                      color: colors.neutral100,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, color: colors.neutral60),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Category filter
              Text(
                l10n.search_filter_category_label,
                style: typography.bodyMediumBold.copyWith(
                  color: colors.neutral100,
                ),
              ),
              const SizedBox(height: 12),

              // Category chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  // All categories chip
                  ChoiceChip(
                    label: Text(l10n.search_filter_all_categories),
                    selected: selectedCategoryId == null,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          selectedCategoryId = null;
                        });
                      }
                    },
                    selectedColor: colors.primaryFocusIris,
                    labelStyle: typography.bodySmallMedium.copyWith(
                      color: selectedCategoryId == null
                          ? Colors.white
                          : colors.neutral80,
                    ),
                  ),
                  // Category chips
                  ...categories.map((category) {
                    final isSelected = selectedCategoryId == category.id;
                    return ChoiceChip(
                      label: Text(category.name),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selectedCategoryId = selected ? category.id : null;
                        });
                      },
                      selectedColor: colors.primaryFocusIris,
                      labelStyle: typography.bodySmallMedium.copyWith(
                        color: isSelected ? Colors.white : colors.neutral80,
                      ),
                    );
                  }).toList(),
                ],
              ),
              const SizedBox(height: 24),

              // Price range filter
              Text(
                l10n.search_filter_price_label,
                style: typography.bodyMediumBold.copyWith(
                  color: colors.neutral100,
                ),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  // Min price
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Min',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixText: '\$ ',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          minPrice = double.tryParse(value);
                        });
                      },
                      controller: TextEditingController(
                        text: minPrice?.toStringAsFixed(0) ?? '',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Max price
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Max',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixText: '\$ ',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          maxPrice = double.tryParse(value);
                        });
                      },
                      controller: TextEditingController(
                        text: maxPrice?.toStringAsFixed(0) ?? '',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Action buttons
              Row(
                children: [
                  // Reset button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.read<SearchBloc>().add(
                          const SearchFilterReset(),
                        );
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: colors.primaryFocusIris),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        l10n.search_filter_reset,
                        style: typography.bodyMediumBold.copyWith(
                          color: colors.primaryFocusIris,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Apply button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<SearchBloc>().add(
                          SearchFilterApplied(
                            categoryId: selectedCategoryId,
                            minPrice: minPrice,
                            maxPrice: maxPrice,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: colors.primaryFocusIris,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        l10n.search_filter_apply,
                        style: typography.bodyMediumBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
