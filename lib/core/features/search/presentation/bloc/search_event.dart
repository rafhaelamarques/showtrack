part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchShowEvent extends SearchEvent {
  final String query;

  const SearchShowEvent({required this.query});
}
