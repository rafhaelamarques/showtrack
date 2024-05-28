import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/data/model/search.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/webapi/client/tv_show_client.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final TvShowClient client = TvShowClient();
  late List<Search> result;

  SearchBloc() : super(const SearchState()) {
    on<SearchingEvent>(
      (event, emit) async {
        emit(state.copyWith(status: SearchStatus.searching));
        try {
          result = await client.searchShows(q: event.query);
          if (result.isEmpty) {
            emit(state.copyWith(status: SearchStatus.empty));
          } else {
            emit(state.copyWith(
              status: SearchStatus.success,
              result: result,
            ));
          }
        } catch (e) {
          emit(state.copyWith(status: SearchStatus.failure));
        }
      },
    );
    on<SearchAddEvent>((event, emit) {
      emit(state.copyWith(
        status: SearchStatus.add,
        show: event.show,
      ));
    });
  }
}
