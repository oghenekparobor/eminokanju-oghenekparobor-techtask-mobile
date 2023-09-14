import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_task/core/network/state.dart';
import 'package:tech_task/module/lunch/domain/repository/repo.dart';
import 'package:tech_task/module/lunch/domain/usecases/recipe.dart';

class MockRepo extends Mock implements LunchRepo {}

void main() {
  late MockRepo repo;
  late GetRecipeUsecase getRecipeUsecase;

  setUp(() {
    repo = MockRepo();
    getRecipeUsecase = GetRecipeUsecase(repo: repo);
  });

  test('get recipe - usecase', () async {
    // arrange
    Set<String> ingredients = {'Cheese', 'Bread'};

    when(
      () => repo.getRecipe(ingredients.join(',')),
    ).thenAnswer((_) async => LoadedState([{}]));

    // Act
    final result = await getRecipeUsecase.call(ingredients);

    // Assert
    expect(result, isA<AppState>());
    verify(() => repo.getRecipe(ingredients.join(','))).called(1);
  });

  test('get recipe - usecase - Error ', () async {
    // Arrange
    var error = ErrorState('failed');
    Set<String> ingredients = {'Cheese', 'Bread'};

    when(() => repo.getRecipe(ingredients.join(','))).thenThrow(error);

    // Act & Assert
    expect(
      () async => await getRecipeUsecase.call(ingredients),
      throwsA(error),
    );

    verify(() => repo.getRecipe(ingredients.join(','))).called(1);
  });
}
