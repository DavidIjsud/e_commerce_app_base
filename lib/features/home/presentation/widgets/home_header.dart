import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/config/assets/ecommerce.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Header widget for home page
///
/// Displays top image, location dropdown, search and notification icons
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.selectedLocation,
    required this.availableLocations,
    required this.onLocationChanged,
  });

  final String selectedLocation;
  final List<String> availableLocations;
  final ValueChanged<String> onLocationChanged;

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final assets = config.assets as EcommerceAssets;
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return Stack(
      children: [
        // Background image
        Image.asset(
          assets.homeTopImage,
          width: double.infinity,
          // height: 280,
          fit: BoxFit.cover,
        ),
        // Gradient overlay
        Container(
          width: double.infinity,
          // height: 280,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.3),
                Colors.black.withValues(alpha: 0.5),
              ],
            ),
          ),
        ),
        // Content
        SafeArea(
          child: SizedBox(
            height: 240,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Top bar with location and icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Location dropdown
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              l10n.home_your_location,
                              style: typography.bodySmallRegular.copyWith(
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: () => _showLocationDialog(
                                context,
                                selectedLocation,
                                availableLocations,
                                onLocationChanged,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: colors.primaryHoverIris,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      selectedLocation,
                                      style: typography.bodyMediumMedium
                                          .copyWith(color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Search and notification icons
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              // TODO: Navigate to search
                            },
                            icon: const Icon(Icons.search, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              // TODO: Navigate to notifications
                            },
                            icon: const Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Main title
                  Text(
                    l10n.home_header_title,
                    style: typography.heading2Bold.copyWith(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showLocationDialog(
    BuildContext context,
    String currentLocation,
    List<String> locations,
    ValueChanged<String> onChanged,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.home_select_location),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: locations.map((location) {
            return RadioListTile<String>(
              title: Text(location),
              value: location,
              groupValue: currentLocation,
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                  Navigator.of(context).pop();
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
