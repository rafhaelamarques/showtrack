import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/webapi/client/tv_show_client.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final TvShowClient _client = TvShowClient();

  DetailsBloc() : super(const DetailsState()) {
    on<DetailsLoadEvent>((event, emit) async {
      await _fetchShow(event.showId, emit);
    });
  }

  Future<void> _fetchShow(int showId, Emitter<DetailsState> emit) async {
    emit(state.copyWith(status: DetailsStatus.loading));

    try {
      final show = await _client.getShowDetails(id: showId);
      emit(state.copyWith(
        status: DetailsStatus.success,
        show: show,
      ));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: DetailsStatus.failure));
    }
  }
}
