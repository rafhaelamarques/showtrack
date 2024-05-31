part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchingEvent extends SearchEvent {
  final String query;

  const SearchingEvent({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}

class SearchAddEvent extends SearchEvent {
  final Show show;

  const SearchAddEvent({
    required this.show,
  });

  @override
  List<Object> get props => [show];
}
