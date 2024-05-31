import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/core/services/application.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/repositories/tv_show_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TvShowRepository _showRepository = getIt<TvShowRepository>();

  HomeBloc() : super(const HomeState()) {
    on<HomeLoadEvent>(
      (event, emit) async {
        await _loadShows(emit);
      },
    );

    on<HomeRemoveShowEvent>(
      (event, emit) async {
        await _deleteShow(event.show, emit);
      },
    );
  }

  Future<void> _loadShows(Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final shows = await _showRepository.getShows();
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
  }

  Future<void> _deleteShow(Show show, Emitter<HomeState> emit) async {
    await _showRepository.deleteShow(show);
    await _loadShows(emit);
  }
}
