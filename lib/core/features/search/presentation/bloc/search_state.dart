part of 'search_bloc.dart';

@immutable
abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<ShowDto> shows;

  const SearchLoadedState({required this.shows});
}

class SearchErrorState extends SearchState {
  final String message;

  const SearchErrorState({required this.message});
}
