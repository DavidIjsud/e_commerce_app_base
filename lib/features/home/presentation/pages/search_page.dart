import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/search_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/search_events.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/search_states.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/empty_search_state.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/search_results_grid.dart';
import 'package:e_commerce_app_base/features/home/presentation/widgets/search_filter_bottom_sheet.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const SearchFilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) {
        final bloc = Get.injector<SearchBloc>();
        bloc.add(const SearchInitialized());
        return bloc;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top padding
                  const SizedBox(height: 40),

                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      l10n.search_page_title,
                      style: typography.heading2Bold.copyWith(
                        color: colors.neutral100,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Search bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SearchBarWidget(
                      onQueryChanged: (query) {
                        context.read<SearchBloc>().add(
                          SearchQueryChanged(query),
                        );
                      },
                      onFilterTap: () => _showFilterBottomSheet(context),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Results or empty state
                  Expanded(
                    child: BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                        // Loading state
                        if (state.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        // Error state
                        if (state.status == SearchStatus.error) {
                          return Center(
                            child: Text(
                              state.errorMessage ?? 'An error occurred',
                              style: typography.bodyMediumRegular.copyWith(
                                color: colors.neutral60,
                              ),
                            ),
                          );
                        }

                        // Empty state (no results or no query yet)
                        if (state.status == SearchStatus.empty ||
                            (state.status == SearchStatus.initial &&
                                state.searchQuery.isEmpty)) {
                          return const EmptySearchState();
                        }

                        // Results state
                        if (state.hasResults) {
                          return SearchResultsGrid(
                            results: state.searchResults,
                          );
                        }

                        // Default: empty state
                        return const EmptySearchState();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
