import 'dart:io';
import 'package:crazy_food/data/storage/local_storage.dart';
import 'package:dio/dio.dart';

import 'logging_interceptor.dart';

class ApiService {
  static const baseUrl = 'http://xx.hmaserv.online/questions/users_auth/';

  static Dio dioClient() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.cacheControlHeader: 'no-Cache',
        if (LocalStorage.getUser != null) 'Authorization': 'Bearer ${LocalStorage.getUser?.apiToken}'
      },
      validateStatus: (status) {
        return status! <= 500;
      },
      connectTimeout: 15000,
      receiveTimeout: 15000,
    );

    Dio _dio = Dio(options);

    _dio.interceptors.add(LoggingInterceptor());

    return _dio;
  }

  static Future<Response<dynamic>> post(
    String path, {
    FormData? formData,
    Map<String, dynamic>? body,
  }) {
    final response = dioClient().post(
      path,
      data: formData ?? FormData.fromMap(body!),
    );
    return response;
  }

  static Future<Response<dynamic>> get(String path) {
    return dioClient().get(path);
  }
}
