import 'package:dio/dio.dart';
import 'package:showtrack/data/services/dio/dio_interceptors.dart';

class DioManager {
  // Singleton
  late final Dio dio;

  static final DioManager _instance = DioManager._internal();
  static DioManager get instance => _instance;

  DioManager._internal() {
    dio = Dio();
    _setup();
  }

  void _setup() {
    const baseURL = 'https://api.tvmaze.com';
    dio.options.baseUrl = baseURL;
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(DioInterceptors());
  }

  /// GET method com headers dinâmicos
  Future<Response> get(String path, {Map<String, dynamic>? headers}) async {
    return dio.get(
      path,
      options: Options(headers: headers),
    );
  }
}
