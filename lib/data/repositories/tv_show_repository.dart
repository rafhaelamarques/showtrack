import 'package:hive/hive.dart';
import 'package:showtrack/data/model/show.dart';

class TvShowRepository {
  static late Box _box;

  TvShowRepository._load();

  static Future<void> init() async {
    if (Hive.isBoxOpen('tv_show')) {
      _box = Hive.box('tv_show');
      return;
    }
    _box = await Hive.openBox('tv_show');
  }

  static Future<TvShowRepository> getInstance() async {
    await init();
    return TvShowRepository._load();
  }

  Future<void> saveShow(Show show) async {
    List<Show> shows = await getShows();
    shows.add(show);
    await _box.put('shows', shows);
  }

  Future<List<Show>> getShows() async {
    return _box.get('shows', defaultValue: <Show>[]).cast<Show>();
  }
}
