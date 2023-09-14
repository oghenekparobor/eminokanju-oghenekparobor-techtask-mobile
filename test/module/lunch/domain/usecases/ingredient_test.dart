import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_task/core/network/state.dart';
import 'package:tech_task/core/usecases/usecases.dart';
import 'package:tech_task/module/lunch/domain/repository/repo.dart';
import 'package:tech_task/module/lunch/domain/usecases/ingredient.dart';

class MockRepo extends Mock implements LunchRepo {}

void main() {
  late MockRepo repo;
  late GetIngredientUsecase getIngredientUsecase;

  setUp(() {
    repo = MockRepo();
    getIngredientUsecase = GetIngredientUsecase(repo: repo);
  });

  test('get ingredient - usecase', () async {
    // arrange
    when(
      () => repo.getIngredients(),
    ).thenAnswer((_) async => LoadedState([{}]));

    // Act
    final result = await getIngredientUsecase.call(NoParams());

    // Assert
    expect(result, isA<AppState>());
    verify(() => repo.getIngredients()).called(1);
  });

  test('get ingredient - usecase - Error ', () async {
    // Arrange
    var error = ErrorState('failed');

    when(() => repo.getIngredients()).thenThrow(error);

    // Act & Assert
    expect(() async => await getIngredientUsecase.call(NoParams()),
        throwsA(error));

    verify(() => repo.getIngredients()).called(1);
  });
}
