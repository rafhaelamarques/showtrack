import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/core/application.dart';
import 'package:showtrack/data/model/search.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/repositories/tv_show_repository.dart';
import 'package:showtrack/data/webapi/client/tv_show_client.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final TvShowClient client = TvShowClient();
  final TvShowRepository repository = getIt<TvShowRepository>();
  final TextEditingController searchController = TextEditingController();
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
          debugPrint(e.toString());
          emit(state.copyWith(status: SearchStatus.failure));
        }
      },
    );
    on<SearchAddEvent>((event, emit) {
      repository.saveShow(event.show);
      emit(state.copyWith(status: SearchStatus.add));
    });
  }
}
