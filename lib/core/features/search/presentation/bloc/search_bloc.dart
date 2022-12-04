import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:showtrack/core/features/search/domain/usecases/search_show_usecase.dart';

import '../../data/dto/show_dto.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchShowUseCase searchShowUseCase;
  SearchBloc({
    required this.searchShowUseCase,
  }) : super(SearchInitialState()) {
    on<SearchEvent>((event, emit) {
      emit(SearchInitialState());
    });

    on<SearchShowEvent>((event, emit) async {
      EasyLoading.show(status: 'Pesquisando...');
      final result = await searchShowUseCase(event.query);
      result.fold(
        (error) => emit(SearchErrorState(message: error.toString())),
        (success) => emit(SearchLoadedState(shows: success)),
      );
    });
  }
}
