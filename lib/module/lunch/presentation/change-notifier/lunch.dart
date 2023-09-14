import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:tech_task/core/extension/app_state.dart';
import 'package:tech_task/core/logger/log.dart';
import 'package:tech_task/core/network/state.dart';
import 'package:tech_task/core/usecases/usecases.dart';
import 'package:tech_task/module/lunch/data/models/ingredient.dart';
import 'package:tech_task/module/lunch/data/models/recipe.dart';
import 'package:tech_task/module/lunch/domain/usecases/ingredient.dart';
import 'package:tech_task/module/lunch/domain/usecases/recipe.dart';

@injectable
class LunchNotifier with ChangeNotifier {
  LunchNotifier({
    required this.getIngredientUsecase,
    required this.getRecipeUsecase,
  });

  final GetRecipeUsecase getRecipeUsecase;
  final GetIngredientUsecase getIngredientUsecase;

  List<Ingredients>? ingredients;

  final StreamController<List<Ingredients>?> _ingredientsStream =
      StreamController<List<Ingredients>?>.broadcast();

  Stream<List<Ingredients>?> get allIngredientStream =>
      _ingredientsStream.stream;

  Future<AppState> getIngredient() async {
    var responses = await getIngredientUsecase.call(NoParams());

    if (!responses.isError) {
      var data = (responses as LoadedState).data as List;
      ingredients = data.map((datum) => Ingredients.fromJson(datum)).toList();
    } else {
      ingredients = [];
    }

    _ingredientsStream.add(ingredients);

    return responses;
  }

  Set<String> selectedIngredients = {};

  void addRemoveIngredient(Ingredients ingredient) {
    if (selectedIngredients.contains(ingredient.title)) {
      selectedIngredients.remove(ingredient.title);
    } else {
      selectedIngredients.add(ingredient.title);
    }

    notifyListeners();
  }

  bool isIngredientSelected(Ingredients ingredient) {
    return selectedIngredients.any((e) => e == ingredient.title);
  }

  List<Recipe>? recipes;

  Future<AppState> getRecipes() async {
    var response = await getRecipeUsecase.call(selectedIngredients);

    if (!response.isError) {
      recipes = (response as LoadedState)
          .data
          .map((e) => Recipe.fromJson(e))
          .toList();
    } else {
      recipes = [];
    }

    return response;
  }
}
