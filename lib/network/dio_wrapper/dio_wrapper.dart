import 'package:dio/dio.dart';

class DioWrapper {
  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioWrapper() {
    _dio.interceptors.clear();
    _dio.options.connectTimeout = 40000;
    _dio.options.receiveTimeout = 40000;
    _dio.options.sendTimeout = 40000;
    _dio.options.responseType = ResponseType.json;
  }
}