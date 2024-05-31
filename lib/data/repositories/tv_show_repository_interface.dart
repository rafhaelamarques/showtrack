import 'package:showtrack/data/model/show.dart';

abstract class ITvShowRepository {
  Future<List<Show>> getShows();
  Future<void> saveShow(Show show);
  Future<void> deleteShow(Show show);
}
