import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:showtrack/core/services/hive_adapters.dart';
import 'package:showtrack/data/repositories/tv_show_repository.dart';
import 'package:showtrack/data/webapi/dio/dio_creator.dart';
import 'package:showtrack/ui/home/bloc/home_bloc.dart';
import 'package:showtrack/ui/search/bloc/search_bloc.dart';

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

    // Registro de blocs
    getIt.registerFactory<SearchBloc>(() => SearchBloc());
    getIt.registerFactory<HomeBloc>(() => HomeBloc());
  }
}
