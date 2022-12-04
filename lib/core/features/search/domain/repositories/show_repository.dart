import 'package:dartz/dartz.dart';
import 'package:showtrack/core/features/search/domain/entities/show_entity.dart';

abstract class ShowRepository {
  Future<Either<Exception, List<ShowEntity>>> search(String query);
}
