import 'package:dartz/dartz.dart';
import 'package:showtrack/core/features/search/domain/entities/show_entity.dart';
import 'package:showtrack/core/features/search/domain/repositories/show_repository.dart';
import 'package:showtrack/core/features/search/domain/usecases/search_show_usecase.dart';

class SearchShowUseCaseImp implements SearchShowUseCase {
  final ShowRepository repository;
  SearchShowUseCaseImp(this.repository);
  @override
  Future<Either<Exception, List<ShowEntity>>> call(String query) async {
    return await repository.search(query);
  }
}
