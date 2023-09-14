import 'package:tech_task/core/network/state.dart';

abstract class LunchRepo {
  Future<AppState> getIngredients();
  Future<AppState> getRecipe(String ingredients);
}
