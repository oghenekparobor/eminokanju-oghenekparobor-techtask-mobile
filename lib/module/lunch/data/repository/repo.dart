import 'package:injectable/injectable.dart';
import 'package:tech_task/core/network/impl.dart';
import 'package:tech_task/core/network/state.dart';
import 'package:tech_task/module/lunch/data/datasource/remote.dart';
import 'package:tech_task/module/lunch/domain/repository/repo.dart';

@LazySingleton(as: LunchRepo)
class LunchRepoImpl implements LunchRepo {
  LunchRepoImpl({
    required this.remote,
    required this.formatter,
  });

  final RemoteDS remote;
  final ImplFormatter formatter;

  @override
  Future<AppState> getIngredients() async {
    return await formatter.format(() async {
      return await remote.ingredients();
    });
  }

  @override
  Future<AppState> getRecipe(String ingredients) async {
    return await formatter.format(() async {
      return await remote.recipes(ingredients);
    });
  }
}
