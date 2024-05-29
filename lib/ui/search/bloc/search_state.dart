part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final SearchStatus status;
  final String query;
  final List<Search> result;

  const SearchState({
    this.status = SearchStatus.initial,
    this.query = '',
    this.result = const [],
  });

  @override
  List<Object> get props => [status, query, result];

  SearchState copyWith({
    SearchStatus? status,
    List<Search>? result,
    String? query,
  }) {
    return SearchState(
      status: status ?? this.status,
      result: result ?? this.result,
      query: query ?? this.query,
    );
  }
}

// Possiveis estados da search page e seus componentes
enum SearchStatus { initial, searching, success, failure, empty, add }

extension SearchStatusX on SearchStatus {
  T when<T>({
    required T Function() initial,
    required T Function() searching,
    required T Function() success,
    required T Function() failure,
    required T Function() empty,
    required T Function() add,
  }) {
    switch (this) {
      case SearchStatus.initial:
        return initial();
      case SearchStatus.searching:
        return searching();
      case SearchStatus.success:
        return success();
      case SearchStatus.failure:
        return failure();
      case SearchStatus.empty:
        return empty();
      case SearchStatus.add:
        return add();
    }
  }
}
