import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:showtrack/data/webapi/dio/dio_tv_maze_creator.dart';
import 'package:showtrack/services/hive_adapters.dart';

class Application {
  /// Inicialização das definições do app
  static Future initialize() async {
    await _hiveInit();
    await _dioInit();
  }

  static Future<void> _hiveInit() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    HiveAdapters.init();
  }

  static Future<void> _dioInit() async {
    // TV Maze API
    const baseUrl = 'https://api.tvmaze.com';
    await DioTvMazeCreator().init(baseUrl);
  }
}
