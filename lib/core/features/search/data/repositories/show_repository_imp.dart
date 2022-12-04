import 'package:showtrack/core/features/search/data/datasources/show_datasource.dart';
import 'package:showtrack/core/features/search/domain/entities/show_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:showtrack/core/features/search/domain/repositories/show_repository.dart';

class ShowRepositoryImp implements ShowRepository {
  ShowDataSource dataSource;
  ShowRepositoryImp(this.dataSource);
  @override
  Future<Either<Exception, List<ShowEntity>>> search(String query) async {
    return await dataSource.searchShow(query);
  }
}
