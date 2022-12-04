import 'package:dartz/dartz.dart';
import 'package:showtrack/core/features/search/data/dto/show_dto.dart';

abstract class ShowDataSource {
  Future<Either<Exception, List<ShowDto>>> searchShow(String query);
}
