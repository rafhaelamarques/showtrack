part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final SearchStatus status;
  final List<Search> result;
  final String query;
  final Show? show;

  const SearchState({
    this.status = SearchStatus.initial,
    this.result = const [],
    this.query = '',
    this.show,
  });

  @override
  List<Object> get props => [status, result, query];

  SearchState copyWith({
    SearchStatus? status,
    List<Search>? result,
    String? query,
    Show? show,
  }) {
    return SearchState(
      status: status ?? this.status,
      result: result ?? this.result,
      query: query ?? this.query,
      show: show ?? this.show,
    );
  }
}

// Possiveis estados da search page e seus componentes
enum SearchStatus { initial, searching, success, failure, empty, add }

extension SearchStatusX on SearchStatus {
  bool get isInitial => this == SearchStatus.initial;
  bool get isSearching => this == SearchStatus.searching;
  bool get isSuccess => this == SearchStatus.success;
  bool get isFailure => this == SearchStatus.failure;
  bool get isEmpty => this == SearchStatus.empty;
  bool get isAddeed => this == SearchStatus.add;
}
