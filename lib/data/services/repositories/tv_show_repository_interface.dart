import 'package:showtrack/data/model/show.dart';

abstract class TvShowRepositoryInterface {
  Future<List<Show>> getShows();
  Future<void> saveShow(Show show);
  Future<void> deleteShow(Show show);
}
