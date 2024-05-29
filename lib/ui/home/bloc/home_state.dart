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

// Possiveis estados da home page e seus componentes
enum HomeStatus { initial, loading, success, failure, empty, selected }

extension HomeStatusX on HomeStatus {
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function() success,
    required T Function() failure,
    required T Function() empty,
    required T Function() selected,
  }) {
    switch (this) {
      case HomeStatus.initial:
        return initial();
      case HomeStatus.loading:
        return loading();
      case HomeStatus.success:
        return success();
      case HomeStatus.failure:
        return failure();
      case HomeStatus.empty:
        return empty();
      case HomeStatus.selected:
        return selected();
    }
  }
}
