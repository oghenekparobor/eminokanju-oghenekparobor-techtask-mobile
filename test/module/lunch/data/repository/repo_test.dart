import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_task/core/network/impl.dart';
import 'package:tech_task/core/network/state.dart';
import 'package:tech_task/module/lunch/data/datasource/remote.dart';
import 'package:tech_task/module/lunch/data/repository/repo.dart';

class MockRemote extends Mock implements RemoteDSImpl {}

class MockFormatter extends Mock implements ImplFormatter {}

void main() {
  late MockRemote remote;
  late MockFormatter formatter;
  late LunchRepoImpl repoImpl;

  setUp(() {
    remote = MockRemote();
    formatter = MockFormatter();
    repoImpl = LunchRepoImpl(remote: remote, formatter: formatter);
  });

  test('get ingredients - repository call', () async {
    // arrange
    const List<dynamic> response = [
      {
        "title": "Ham",
        "use-by": "2020-11-25",
      },
    ];

    when(
      () => formatter.format(any()),
    ).thenAnswer((_) async => LoadedState(response));

    when(() => remote.ingredients()).thenAnswer((_) async => response);

    // act
    var result = await repoImpl.getIngredients();

    // assert
    expect(result, isA<AppState>());
    expect((result as LoadedState).data, isList);
  });

  test('get ingredients - repository call - failed', () async {
    // arrange
    var error = ErrorState('failed to get ingredients');

    when(
      () => formatter.format(any()),
    ).thenThrow(error);

    when(() => remote.ingredients()).thenThrow(error);

    // act
    expect(() async => await repoImpl.getIngredients(), throwsA(error));
  });

  test('get recipes - repository call', () async {
    // arrange
    const String ingredients = 'Bread, Cheese';

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

    when(
      () => formatter.format(any()),
    ).thenAnswer((_) async => LoadedState(response));

    when(() => remote.recipes(ingredients)).thenAnswer((_) async => response);

    // act
    var result = await repoImpl.getRecipe(ingredients);

    // assert
    expect(result, isA<AppState>());
    expect((result as LoadedState).data, isList);
  });

  test('get recipes - repository call - failed', () async {
    // arrange
    const String ingredients = 'Bread, Cheese';
    var error = ErrorState('failed to get ingredients');

    when(
      () => formatter.format(any()),
    ).thenThrow(error);

    when(() => remote.recipes(ingredients)).thenThrow(error);

    // act
    expect(() async => await repoImpl.getRecipe(ingredients), throwsA(error));
  });
}
