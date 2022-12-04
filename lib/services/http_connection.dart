import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../utils/constants.dart';

class HttpConections {
  final Dio dio;
  HttpConections(this.dio);
  String currentServerUrl = SERVER_URL;

  Future<Response> getConnect({required url}) async {
    if (kDebugMode) {
      print('url : $url');
    }
    try {
      dio.options.headers.clear();
      dio.options.connectTimeout = 30000; //5s
      dio.options.receiveTimeout = 25000;

      return await dio.get(currentServerUrl + url);
    } on DioError catch (e) {
      if (e.response == null) throw "error ${e.toString()}";
      throw e.response!.data is String ? e : e.response!.data['mensagem'];
    }
  }

  Future<Response> postConnect({required url, required data}) async {
    if (kDebugMode) {
      print('url : $url');
      print('postData : $data');
    }

    try {
      dio.options.headers.clear();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.connectTimeout = 30000; //5s
      dio.options.receiveTimeout = 25000;

      if (url.toString().contains("discord")) {
        return await dio.post(currentServerUrl + url, data: data);
      } else {
        return await dio.post(currentServerUrl + url, data: data);
      }
    } on DioError catch (e) {
      if (e.response == null) throw "error ${e.toString()}";
      throw e.response!.data is String ? e : e.response!.data['mensagem'];
    }
  }

  Future<Response> postConnectFormData({required url, required data}) async {
    if (kDebugMode) {
      print('url : $url');
      print('postData : $data');
    }

    try {
      dio.options.headers.clear();
      dio.options.headers['content-Type'] = 'multipart/form-data';
      dio.options.connectTimeout = 30000; //5s
      dio.options.receiveTimeout = 25000;
      return await dio.post(currentServerUrl + url, data: data);
    } on DioError catch (e) {
      if (e.response == null) throw "error ${e.toString()}";
      throw e.response!.data is String ? e : e.response!.data['mensagem'];
    }
  }

  Future<Response> putConnect({required url, required data}) async {
    if (kDebugMode) {
      print('url : $url');
      print('postData : $data');
      print('tudo : ${currentServerUrl + url}');
    }

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.connectTimeout = 30000; //5s
      dio.options.receiveTimeout = 25000;

      return await dio.put(currentServerUrl + url, data: data);
    } on DioError catch (e) {
      if (e.response == null) throw "error ${e.toString()}";
      throw e.response!.data is String ? e : e.response!.data['mensagem'];
    }
  }
}
