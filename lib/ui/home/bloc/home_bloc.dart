import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/core/application.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/repositories/tv_show_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeLoadEvent>(
      (event, emit) async {
        emit(state.copyWith(status: HomeStatus.loading));
        final showRepository = getIt<TvShowRepository>();
        try {
          final shows = await showRepository.getShows();
          if (shows.isEmpty) {
            emit(state.copyWith(status: HomeStatus.empty));
          } else {
            emit(state.copyWith(
              status: HomeStatus.success,
              shows: shows,
            ));
          }
        } catch (e) {
          debugPrint(e.toString());
          emit(state.copyWith(status: HomeStatus.failure));
        }
      },
    );
    on<HomeSelectedEvent>((event, emit) {
      emit(state.copyWith(
        status: HomeStatus.selected,
        selectedShowId: event.showId,
      ));
    });
  }
}
