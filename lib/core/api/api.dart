import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../config/config.dart';

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = Config.baseUrl;
    _dio.options.headers = Config.header;
    _dio.options.responseDecoder;
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      error: true,
      responseBody: true,
    ));
    // sau 5s se huy request
    _dio.options.receiveTimeout = const Duration(seconds: 5);
    
  }

  Dio get sendRequest => _dio;
}
