part of 'home_bloc.dart';

@immutable
class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoadEvent extends HomeEvent {}

class HomeRemoveShowEvent extends HomeEvent {
  final Show show;

  const HomeRemoveShowEvent(this.show);

  @override
  List<Object> get props => [show];
}
