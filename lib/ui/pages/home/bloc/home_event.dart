part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
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

class HomeFilterShowEvent extends HomeEvent {
  final ShowStatusEnum status;

  const HomeFilterShowEvent(this.status);

  @override
  List<Object> get props => [status];
}
