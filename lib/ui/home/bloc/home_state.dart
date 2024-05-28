part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final HomeStatus status;
  final List<Show> shows;
  final int selectedShowId;

  const HomeState({
    this.status = HomeStatus.initial,
    this.shows = const [],
    this.selectedShowId = 0,
  });

  @override
  List<Object> get props => [status, shows];

  HomeState copyWith({
    HomeStatus? status,
    List<Show>? shows,
    int? selectedShowId,
  }) {
    return HomeState(
      status: status ?? this.status,
      shows: shows ?? this.shows,
      selectedShowId: selectedShowId ?? this.selectedShowId,
    );
  }
}

// Possiveis estados da home page
enum HomeStatus { initial, loading, success, failure, empty, selected }

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
  bool get isEmpty => this == HomeStatus.empty;
  bool get isSelected => this == HomeStatus.selected;
}
