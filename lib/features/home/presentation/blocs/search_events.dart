import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchInitialized extends SearchEvent {
  const SearchInitialized();
}

class SearchQueryChanged extends SearchEvent {
  const SearchQueryChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

class SearchFilterApplied extends SearchEvent {
  const SearchFilterApplied({
    this.categoryId,
    this.minPrice,
    this.maxPrice,
  });

  final String? categoryId;
  final double? minPrice;
  final double? maxPrice;

  @override
  List<Object?> get props => [categoryId, minPrice, maxPrice];
}

class SearchFilterReset extends SearchEvent {
  const SearchFilterReset();
}
