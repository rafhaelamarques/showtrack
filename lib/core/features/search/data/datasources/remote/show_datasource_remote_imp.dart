import 'package:dartz/dartz.dart';
import 'package:showtrack/core/features/search/data/datasources/show_datasource.dart';
import 'package:showtrack/core/features/search/data/dto/show_dto.dart';
import 'package:showtrack/services/http_connection.dart';
import '../../../../../../utils/constants.dart';

class ShowDatSourceRemoteImp implements ShowDataSource {
  final HttpConections httpConections;

  ShowDatSourceRemoteImp(this.httpConections);
  @override
  Future<Either<Exception, List<ShowDto>>> searchShow(String query) async {
    var uri = Uri.parse('search/shows?').replace(queryParameters: {
      "q": query,
    });

    try {
      var response = await httpConections.getConnect(url: uri);
      if (response.statusCode == 200) {
        return Right(
            response.data.map<ShowDto>((s) => ShowDto.fromJson(s)).toList());
      } else if (response.statusCode == STATUS_BAD_REQUEST) {
        return Left(Exception('Confirar o termo pesquisado.'));
      } else if (response.statusCode == STATUS_NOT_AUTHORIZED) {
        return Left(Exception('Sem Autorização.'));
      } else if (response.statusCode == STATUS_NOT_FOUND) {
        return Left(Exception('Não encontrado.'));
      } else if (response.statusCode == STATUS_INTERNAL_ERROR) {
        return Left(Exception(
            'Algo de errado aconteceu mas já estamos cientes. Tente novamente mais tarde.'));
      } else {
        throw response.data['status']['mensagem'];
      }
    } catch (error) {
      if (error.toString().contains('DioError')) {
        return Left(Exception(
            "Falha ao conectar com servidor. Tente novamente mais tarde."));
      }
      return Left(Exception(error.toString()));
    }
  }
}
