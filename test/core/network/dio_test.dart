import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_task/core/env/env.dart';
import 'package:tech_task/core/network/dio.dart';
import 'package:tech_task/core/secure-storage/secure.dart';

class MockDio extends Mock implements Dio {}

class MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  late MockDio dio;
  late NetworkRequester requester;

  setUp(() async {
    dio = MockDio();

    requester = NetworkRequester(dio: dio);
  });

  test('get request', () async {
    // arrange
    const String endpoint = '/endpoint';
    const bool isProtected = true;
    const bool isFormData = false;

    final List<Map<String, Object>> responseData = [
      {},
    ];

    when(() => dio.get(
          '${Env.baseUrl}$endpoint',
          options: any(named: 'options'),
        )).thenAnswer((_) async => Response<dynamic>(
          requestOptions: RequestOptions(path: endpoint, method: 'GET'),
          data: responseData,
        ));

    // Act
    final res = await requester.get(
      endpoint,
      isFormData: isFormData,
      isProtected: isProtected,
    );

    // Assert
    expect(res, responseData);
    expect(res, isList);
  });

  test('post request', () async {
    // arrange
    const String endpoint = '/your/endpoint';
    const bool isProtected = false;
    const bool isFormData = false;

    final Map<String, Object> responseData = {};

    when(() => dio.post(
          '${Env.baseUrl}$endpoint',
          data: responseData,
          options: any(named: 'options'),
        )).thenAnswer((_) async => Response<dynamic>(
          requestOptions: RequestOptions(path: endpoint, method: 'POST'),
          data: responseData,
        ));

    // Act
    final res = await requester.post(
      endpoint,
      data: responseData,
      isFormData: isFormData,
      isProtected: isProtected,
    );

    // Assert
    expect(res, responseData);
  });

  test('patch request', () async {
    // arrange
    const String endpoint = '/your/endpoint';
    const bool isProtected = true;
    const bool isFormData = false;

    final Map<String, Object> responseData = {
      
    };

    when(() => dio.patch(
          '${Env.baseUrl}$endpoint',
          data: responseData,
          options: any(named: 'options'),
        )).thenAnswer((_) async => Response<dynamic>(
          requestOptions: RequestOptions(path: endpoint, method: 'PATCH'),
          data: responseData,
        ));

    // Act
    final res = await requester.patch(
      endpoint,
      data: responseData,
      isFormData: isFormData,
      isProtected: isProtected,
    );

    // Assert
    expect(res, responseData);
  });

  test('delete request', () async {
    // arrange
    const String endpoint = '/your/endpoint';
    const bool isProtected = true;
    const bool isFormData = false;

    final Map<String, Object> responseData = {
     
    };


    when(() => dio.delete(
          '${Env.baseUrl}$endpoint',
          options: any(named: 'options'),
        )).thenAnswer((_) async => Response<dynamic>(
          requestOptions: RequestOptions(path: endpoint, method: 'DELETE'),
          data: responseData,
        ));

    // Act
    final res = await requester.delete(
      endpoint,
      isFormData: isFormData,
      isProtected: isProtected,
    );

    // Assert
    expect(res, responseData);
  });
}
