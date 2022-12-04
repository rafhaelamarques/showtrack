import 'package:get_it/get_it.dart';
import 'package:showtrack/core/features/search/data/repositories/show_repository_imp.dart';
import 'package:showtrack/core/features/search/domain/repositories/show_repository.dart';
import 'package:showtrack/core/features/search/domain/usecases/search_show_usecase_imp.dart';
import 'package:showtrack/core/features/search/presentation/bloc/search_bloc.dart';

import '../../features/search/data/datasources/remote/show_datasource_remote_imp.dart';
import '../../features/search/data/datasources/show_datasource.dart';
import '../../features/search/domain/usecases/search_show_usecase.dart';

Future<void> initSearch(GetIt getIt) async {
  //Bloc
  getIt.registerFactory<SearchBloc>(
      () => SearchBloc(searchShowUseCase: getIt()));

  //UseCase
  getIt.registerLazySingleton<SearchShowUseCase>(
      () => SearchShowUseCaseImp(getIt()));

  //Repository
  getIt.registerLazySingleton<ShowRepository>(() => ShowRepositoryImp(getIt()));

  //DataSource
  getIt.registerLazySingleton<ShowDataSource>(
      () => ShowDatSourceRemoteImp(getIt()));
}
