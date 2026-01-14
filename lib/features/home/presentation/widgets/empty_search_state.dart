import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

class EmptySearchState extends StatelessWidget {
  const EmptySearchState({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final assets = config.assets;
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Search illustration
            Image.asset(
              assets.searchEmptyImage,
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),

            // Title
            Text(
              l10n.search_no_results_title,
              style: typography.heading5Bold.copyWith(
                color: colors.neutral100,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              l10n.search_no_results_description,
              style: typography.bodyMediumRegular.copyWith(
                color: colors.neutral60,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
