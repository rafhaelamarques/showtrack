import 'package:hive/hive.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/data/services/repositories/tvshow_repository_interface.dart';

class TvShowHiveRepository implements TvShowRepositoryInterface {
  // Pseudo singleton
  static late Box _box;

  TvShowHiveRepository._load();

  static Future<void> _init() async {
    if (Hive.isBoxOpen('shows')) {
      _box = Hive.box('shows');
      return;
    }
    _box = await Hive.openBox('shows');
  }

  static Future<TvShowHiveRepository> getInstance() async {
    await _init();
    return TvShowHiveRepository._load();
  }

  @override
  Future<List<Show>> getShows() async {
    return _box.get('shows', defaultValue: <Show>[]).cast<Show>();
  }

  @override
  Future<void> saveShow(Show show) async {
    List<Show> shows = await getShows();
    if (shows.any((element) => element.id == show.id)) {
      shows.removeWhere((element) => element.id == show.id);
    } else {
      shows.add(show);
    }
    await _box.put('shows', shows);
  }

  @override
  Future<void> deleteShow(Show show) async {
    List<Show> shows = await getShows();
    shows.removeWhere((element) => element.id == show.id);
    await _box.put('shows', shows);
  }
}
