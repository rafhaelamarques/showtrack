import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/data/model/search.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/repositories/tv_show_repository_interface.dart';
import 'package:showtrack/data/webapi/client/tv_show_client.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ITvShowRepository showRepository;
  final TvShowClient showClient;

  late List<Search> _result;
  late List<Show> _addedShows;

  List<Show> get addedShows => _addedShows;

  SearchBloc({
    required this.showRepository,
    required this.showClient,
  }) : super(const SearchState()) {
    on<SearchingEvent>(
      (event, emit) async {
        await _fetchShows(event.query, emit);
      },
    );
    on<SearchAddEvent>((event, emit) {
      showRepository.saveShow(event.show);
      emit(state.copyWith(status: SearchStatus.add));
    });
  }

  Future<void> _fetchShows(String query, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.searching));
    await _getAddedShows();

    try {
      _result = await showClient.searchShows(q: query.trim());
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
    _addedShows = await showRepository.getShows();
  }
}
