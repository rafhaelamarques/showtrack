import 'package:dio/dio.dart';
import 'package:showtrack/data/webapi/dio/dio_interceptors.dart';

class DioTvMazeCreator {
  // Singleton
  static final DioTvMazeCreator _instance = DioTvMazeCreator._internal();

  factory DioTvMazeCreator() {
    return _instance;
  }

  DioTvMazeCreator._internal();
  // Singleton

  late String _baseUrl;
  Future<void> init(String baseUrl) async {
    _baseUrl = baseUrl;
  }

  Dio create() {
    Dio dio = Dio();
    dio.options.baseUrl = _baseUrl;
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(DioInterceptors());

    return dio;
  }
}
