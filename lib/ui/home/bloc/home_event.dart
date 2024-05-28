part of 'home_bloc.dart';

@immutable
class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoadEvent extends HomeEvent {}

class HomeSelectedEvent extends HomeEvent {
  final int showId;

  const HomeSelectedEvent({
    required this.showId,
  });

  @override
  List<Object> get props => [showId];
}
