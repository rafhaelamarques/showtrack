import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/core/services/application.dart';
import 'package:showtrack/data/model/search.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/repositories/tv_show_repository.dart';
import 'package:showtrack/data/webapi/client/tv_show_client.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final TvShowClient _client = TvShowClient();
  final TvShowRepository _repository = getIt<TvShowRepository>();
  late List<Search> _result;
  late List<Show> addedShows;

  SearchBloc() : super(const SearchState()) {
    on<SearchingEvent>(
      (event, emit) async {
        await _fetchShows(event.query, emit);
      },
    );
    on<SearchAddEvent>((event, emit) {
      _repository.saveShow(event.show);
      emit(state.copyWith(status: SearchStatus.add));
    });
  }

  Future<void> _fetchShows(String query, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.searching));
    await _getAddedShows();

    try {
      _result = await _client.searchShows(q: query.trim());
      if (_result.isEmpty) {
        emit(state.copyWith(status: SearchStatus.empty));
      } else {
        emit(state.copyWith(
          status: SearchStatus.success,
          result: _result,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }

  Future<void> _getAddedShows() async {
    addedShows = await _repository.getShows();
  }
}
