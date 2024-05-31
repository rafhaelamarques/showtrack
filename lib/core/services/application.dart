import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:showtrack/core/services/hive_adapters.dart';
import 'package:showtrack/data/repositories/tv_show_repository.dart';
import 'package:showtrack/data/webapi/dio/dio_creator.dart';
import 'package:showtrack/ui/details/bloc/details_bloc.dart';
import 'package:showtrack/ui/home/bloc/home_bloc.dart';
import 'package:showtrack/ui/search/bloc/search_bloc.dart';

final getIt = GetIt.instance;

class Application {
  /// Inicialização das definições do app
  static Future initialize() async {
    await _hiveInit();
    await _bindings();
  }

  static Future<void> _hiveInit() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    HiveAdapters.init();
  }

  static Future<void> _bindings() async {
    // Registro do Dio
    getIt.registerLazySingleton<DioCreator>(() => DioCreator());

    // Inicialização e registro do TvShowRepository
    final tvShowRepository = await TvShowRepository.getInstance();
    getIt.registerLazySingleton<TvShowRepository>(() => tvShowRepository);

    // Registro de blocs
    getIt.registerFactory<SearchBloc>(() => SearchBloc());
    getIt.registerFactory<HomeBloc>(() => HomeBloc());
    getIt.registerFactory<DetailsBloc>(() => DetailsBloc());
  }
}
