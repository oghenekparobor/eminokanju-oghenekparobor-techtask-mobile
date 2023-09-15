import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tech_task/core/env/env.dart';

@lazySingleton
class NetworkRequester {
  NetworkRequester({
    required this.dio,
  });

  final Dio dio;

  Future<dynamic> get(
    String endpoint, {
    bool isProtected = true,
    bool isFormData = false,
  }) async {
    Response response = await dio.get(
      '${Env.baseUrl}$endpoint',
      options: Options(headers: {
        // if (isProtected) 'Authorization': 'Bearer $_token',
        'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
      }),
    );

    return response.data;
  }

  Future<dynamic> post(
    String endpoint, {
    required Map<String, dynamic> data,
    bool isProtected = true,
    bool isFormData = false,
  }) async {
    Response response = await dio.post(
      '${Env.baseUrl}$endpoint',
      data: isFormData ? FormData.fromMap(data) : data,
      options: Options(headers: {
        // if (isProtected) 'Authorization': 'Bearer $_token',
        'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
      }),
    );

    return response.data;
  }

  Future<dynamic> patch(
    String endpoint, {
    required Map<String, dynamic> data,
    bool isProtected = true,
    bool isFormData = false,
  }) async {
    Response response = await dio.patch(
      '${Env.baseUrl}$endpoint',
      data: isFormData ? FormData.fromMap(data) : data,
      options: Options(headers: {
        // if (isProtected) 'Authorization': 'Bearer $_token',
        'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
      }),
    );

    return response.data;
  }

  Future<dynamic> delete(
    String endpoint, {
    bool isProtected = true,
    bool isFormData = false,
  }) async {
    Response response = await dio.delete(
      '${Env.baseUrl}$endpoint',
      options: Options(headers: {
        // if (isProtected) 'Authorization': 'Bearer $_token',
        'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
      }),
    );

    return response.data;
  }
}
