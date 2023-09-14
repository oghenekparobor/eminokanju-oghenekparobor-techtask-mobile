import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_task/core/network/dio.dart';
import 'package:tech_task/module/lunch/data/datasource/remote.dart';

class MockRequester extends Mock implements NetworkRequester {}

void main() {
  late MockRequester requester;
  late RemoteDSImpl remote;

  setUp(() {
    requester = MockRequester();
    remote = RemoteDSImpl(requester: requester);
  });

  test('get all ingredients', () async {
    // arrange
    const String endpoint = '/ingredients';
    const List<dynamic> response = [
      {
        "title": "Ham",
        "use-by": "2020-11-25",
      },
    ];

    when(() => requester.get(endpoint)).thenAnswer(
      (_) async => response,
    );

    // act
    var result = await remote.ingredients();

    // assert
    expect(result, response);
    expect(result, isList);

    verify(() => requester.get(endpoint)).called(1);
  });

  test('get all ingredients - Request Failure', () async {
    // Arrange
    const String endpoint = '/ingredients';
    const dynamic error = {
      "status": false,
      "message": "failed",
    };

    // Mocking the network request
    when(() => requester.get(endpoint)).thenThrow(error);

    // Act & Assert
    expect(
      () async => await remote.ingredients(),
      throwsA(error),
    );
    verify(() => requester.get(endpoint)).called(1);
  });

  test('get recipes from ingredients sent', () async {
    // arrange
    const String ingredients = 'Bread, Cheese';
    String endpoint = '/recipes?ingredients=$ingredients';
    const List<dynamic> response = [
      {
        "title": "Ham and Cheese Toastie",
        "ingredients": [
          "Ham",
          "Cheese",
          "Bread",
          "Butter",
        ]
      },
    ];

    when(() => requester.get(endpoint)).thenAnswer(
      (_) async => response,
    );

    // act
    var result = await remote.recipes(ingredients);

    // assert
    expect(result, response);
    expect(result, isList);

    verify(() => requester.get(endpoint)).called(1);
  });

  test('get recipes - Request Failure', () async {
    // Arrange
    const String ingredients = 'Bread, Cheese';
    String endpoint = '/recipes?ingredients=$ingredients';
    const dynamic error = {
      "status": false,
      "message": "failed",
    };

    // Mocking the network request
    when(() => requester.get(endpoint)).thenThrow(error);

    // Act & Assert
    expect(
      () async => await remote.recipes(ingredients),
      throwsA(error),
    );
    verify(() => requester.get(endpoint)).called(1);
  });
}
