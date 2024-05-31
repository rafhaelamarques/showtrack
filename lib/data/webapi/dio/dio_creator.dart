import 'package:dio/dio.dart';
import 'package:showtrack/data/webapi/dio/dio_interceptors.dart';

class DioCreator {
  // Singleton
  static final DioCreator _instance = DioCreator._internal();

  factory DioCreator() => _instance;

  DioCreator._internal();
  // Singleton

  /// Dio base com algumas configurações padrão
  /// permitindo url e interceptors customizados
  Dio _create({
    required String baseUrl,
    List<Interceptor>? interceptors,
  }) {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(DioInterceptors());
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }

    return dio;
  }

  /// Dio usado para a API TVMaze
  Dio tvMaze() => _create(baseUrl: 'https://api.tvmaze.com');
}
