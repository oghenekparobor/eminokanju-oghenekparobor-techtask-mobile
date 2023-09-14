import 'package:injectable/injectable.dart';
import 'package:tech_task/core/network/state.dart';
import 'package:tech_task/core/usecases/usecases.dart';
import 'package:tech_task/module/lunch/domain/repository/repo.dart';

@lazySingleton
class GetRecipeUsecase extends Usecase<Future<AppState>, List<String>> {
  GetRecipeUsecase({
    required this.repo,
  });

  final LunchRepo repo;

  @override
  Future<AppState> call(List<String> params) async {
    String ingredients = params.join(',');

    return await repo.getRecipe(ingredients);
  }
}
