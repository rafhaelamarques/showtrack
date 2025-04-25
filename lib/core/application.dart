import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:showtrack/core/hive_adapters.dart';
import 'package:showtrack/data/services/client/tvshow_client.dart';
import 'package:showtrack/data/services/dio/dio_manager.dart';
import 'package:showtrack/data/services/repositories/tvshow_hive_repository.dart';
import 'package:showtrack/data/services/repositories/tvshow_repository_interface.dart';
import 'package:showtrack/data/services/repositories/tvshow_sqlite_repository.dart';
import 'package:showtrack/ui/pages/details/bloc/details_bloc.dart';
import 'package:showtrack/ui/pages/home/bloc/home_bloc.dart';
import 'package:showtrack/ui/pages/search/bloc/search_bloc.dart';

final getIt = GetIt.instance;

class Application {
  /// Inicialização das definições do app
  static Future setup() async {
    await _hiveSetup();
    await _clientsSetup();
    await _repositoriesSetup();
    await _blocsSetup();
  }

  static Future<void> _hiveSetup() async {
    // Inicialização do Hive e seus adapters
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    HiveAdapters.init();
  }

  static Future<void> _clientsSetup() async {
    // Registro de DioManager
    getIt.registerLazySingleton<DioManager>(() => DioManager.instance);

    // Registro de clients
    getIt.registerFactory<TvShowClient>(
      () => TvShowClient(dio: getIt<DioManager>()),
    );
  }

  static Future<void> _repositoriesSetup() async {
    // Inicialização e registro dos repositories
    final tvShowHiveRepository = await TvShowHiveRepository.getInstance();
    getIt.registerLazySingleton<TvShowHiveRepository>(
        () => tvShowHiveRepository);

    final tvShowSqliteRepository = await TvShowSqliteRepository.getInstance();
    getIt.registerLazySingleton<TvShowSqliteRepository>(
        () => tvShowSqliteRepository);

    getIt.registerLazySingleton<TvShowRepositoryInterface>(
      () => tvShowHiveRepository,
    );
  }

  static Future<void> _blocsSetup() async {
    // Registro de blocs com bindings
    getIt.registerFactory<HomeBloc>(() => HomeBloc(
          showRepository: getIt<TvShowRepositoryInterface>(),
        ));
    getIt.registerFactory<SearchBloc>(() => SearchBloc(
          showRepository: getIt<TvShowRepositoryInterface>(),
          showClient: getIt<TvShowClient>(),
        ));
    getIt.registerFactory<DetailsBloc>(() => DetailsBloc(
          showClient: getIt<TvShowClient>(),
        ));
  }
}
