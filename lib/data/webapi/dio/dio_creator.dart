import 'package:dio/dio.dart';
import 'package:showtrack/data/webapi/dio/dio_interceptors.dart';

class DioCreator {
  // Singleton
  static final DioCreator _instance = DioCreator._internal();

  factory DioCreator() => _instance;

  DioCreator._internal();
  // Singleton

  /// Dio base com configurações padrão e permitindo url customizada
  Dio _create({
    required String baseUrl,
  }) {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(DioInterceptors());

    return dio;
  }

  /// Dio usado para a API TVMaze
  Dio tvMaze() => _create(baseUrl: 'https://api.tvmaze.com');
}
