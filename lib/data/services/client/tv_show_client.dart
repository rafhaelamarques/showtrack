import 'package:showtrack/data/model/search.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/services/client/tv_show_client_interface.dart';
import 'package:showtrack/data/services/dio/dio_manager.dart';

class TvShowRequestFailure implements Exception {
  final String message = 'Show request failed';

  @override
  String toString() => message;
}

class TvShowNotFoundFailure implements Exception {
  final String message = 'Show not found';

  @override
  String toString() => message;
}

class TvShowClient implements TvShowClientInterface {
  final DioManager dio;
  TvShowClient({required this.dio});

  @override
  Future<List<Search>> searchShows({String? q}) async {
    try {
      final response = await dio.get('/search/shows?q=$q');

      if (response.statusCode != 200) {
        throw TvShowRequestFailure();
      }
      if (response.data == null) {
        throw TvShowNotFoundFailure();
      }

      final data = response.data;
      return List.from(data.map((e) => Search.fromJson(e)));
    } catch (e) {
      throw TvShowRequestFailure();
    }
  }

  @override
  Future<Show> getShowDetails({required int id}) async {
    try {
      final response = await dio.get('/shows/$id?embed=nextepisode');

      if (response.statusCode != 200) {
        throw TvShowRequestFailure();
      }
      if (response.data == null) {
        throw TvShowNotFoundFailure();
      }

      final data = response.data;
      return Show.fromJson(data);
    } catch (e) {
      throw TvShowRequestFailure();
    }
  }
}
