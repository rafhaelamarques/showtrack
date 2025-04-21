import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:showtrack/core/hive_adapters.dart';
import 'package:showtrack/data/services/client/tv_show_client.dart';
import 'package:showtrack/data/services/dio/dio_manager.dart';
import 'package:showtrack/data/services/repositories/tv_show_repository.dart';
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
    // Inicialização e registro do TvShowRepository
    final tvShowRepository = await TvShowRepository.getInstance();
    getIt.registerLazySingleton<TvShowRepository>(() => tvShowRepository);
  }

  static Future<void> _blocsSetup() async {
    // Registro de blocs com bindings
    getIt.registerFactory<HomeBloc>(() => HomeBloc(
          showRepository: getIt<TvShowRepository>(),
        ));
    getIt.registerFactory<SearchBloc>(() => SearchBloc(
          showRepository: getIt<TvShowRepository>(),
          showClient: getIt<TvShowClient>(),
        ));
    getIt.registerFactory<DetailsBloc>(() => DetailsBloc(
          showClient: getIt<TvShowClient>(),
        ));
  }
}
