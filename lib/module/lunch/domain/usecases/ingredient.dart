import 'package:injectable/injectable.dart';
import 'package:tech_task/core/network/state.dart';
import 'package:tech_task/core/usecases/usecases.dart';
import 'package:tech_task/module/lunch/domain/repository/repo.dart';

@lazySingleton
class GetIngredientUsecase extends Usecase<Future<AppState>, NoParams> {
  GetIngredientUsecase({
    required this.repo,
  });

  final LunchRepo repo;

  @override
  Future<AppState> call(NoParams params) async {
    return await repo.getIngredients();
  }
}
