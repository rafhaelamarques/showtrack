import 'package:hive/hive.dart';
import 'package:showtrack/data/model/show.dart';

class TvShowRepository {
  static late Box _box;

  TvShowRepository._load();

  static Future<void> init() async {
    if (Hive.isBoxOpen('shows')) {
      _box = Hive.box('shows');
      return;
    }
    _box = await Hive.openBox('shows');
  }

  static Future<TvShowRepository> getInstance() async {
    await init();
    return TvShowRepository._load();
  }

  Future<List<Show>> getShows() async {
    return _box.get('shows', defaultValue: <Show>[]).cast<Show>();
  }

  Future<void> saveShow(Show show) async {
    List<Show> shows = await getShows();
    if (shows.any((element) => element.id == show.id)) {
      shows.removeWhere((element) => element.id == show.id);
    } else {
      shows.add(show);
    }
    await _box.put('shows', shows);
  }

  Future<void> deleteShow(Show show) async {
    List<Show> shows = await getShows();
    shows.removeWhere((element) => element.id == show.id);
    await _box.put('shows', shows);
  }
}
