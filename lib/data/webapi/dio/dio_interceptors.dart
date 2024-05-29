import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioInterceptors extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint(
        'REQUEST[${options.method}] => PATH: ${options.path}/${options.queryParameters['q']}');

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}/${response.requestOptions.queryParameters['q']}');

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('ERROR[${err.response?.statusCode}] => MESSAGE: ${err.message}');

    return super.onError(err, handler);
  }
}
