part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class DetailsLoadEvent extends DetailsEvent {
  final int showId;

  const DetailsLoadEvent({
    required this.showId,
  });

  @override
  List<Object> get props => [showId];
}
