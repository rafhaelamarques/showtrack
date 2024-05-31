part of 'details_bloc.dart';

@immutable
class DetailsState extends Equatable {
  final DetailsStatus status;
  final Show? show;
  const DetailsState({
    this.status = DetailsStatus.initial,
    this.show,
  });

  @override
  List<Object> get props => [status, show ?? ''];

  DetailsState copyWith({
    DetailsStatus? status,
    Show? show,
  }) {
    return DetailsState(
      status: status ?? this.status,
      show: show ?? this.show,
    );
  }
}

enum DetailsStatus { initial, loading, success, failure }

extension DetailsStatusX on DetailsStatus {
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function() success,
    required T Function() failure,
  }) {
    switch (this) {
      case DetailsStatus.initial:
        return initial();
      case DetailsStatus.loading:
        return loading();
      case DetailsStatus.success:
        return success();
      case DetailsStatus.failure:
        return failure();
    }
  }
}
