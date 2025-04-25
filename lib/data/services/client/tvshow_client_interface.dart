import 'package:showtrack/data/model/search.dart';
import 'package:showtrack/data/model/show.dart';

abstract class TvShowClientInterface {
  Future<List<Search>> searchShows({required String q});
  Future<Show> getShowDetails({required int id});
}
