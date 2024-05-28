import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/repositories/tv_show_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TvShowRepository showRepository;
  HomeBloc({
    required this.showRepository,
  }) : super(const HomeState()) {
    on<HomeLoadEvent>(
      (event, emit) async {
        emit(state.copyWith(status: HomeStatus.loading));
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
