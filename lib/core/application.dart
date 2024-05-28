import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:showtrack/data/repositories/tv_show_repository.dart';
import 'package:showtrack/data/webapi/dio/dio_creator.dart';
import 'package:showtrack/services/hive_adapters.dart';

final getIt = GetIt.instance;

class Application {
  /// Inicialização das definições do app
  static Future initialize() async {
    await _hiveInit();
    await _injects();
  }

  static Future<void> _hiveInit() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    HiveAdapters.init();
  }

  static Future<void> _injects() async {
    // Registro do Dio
    getIt.registerSingleton<DioCreator>(DioCreator());

    // Inicialização e registro do TvShowRepository
    final tvShowRepository = await TvShowRepository.getInstance();
    getIt.registerSingleton<TvShowRepository>(tvShowRepository);
  }
}
