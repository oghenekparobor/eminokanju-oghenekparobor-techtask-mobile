import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:tech_task/core/extension/app_state.dart';
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

  List<Ingredients>? _ingredients;
  List<Ingredients>? get ingredients => _ingredients;

  final StreamController<List<Ingredients>?> _ingredientsStream =
      StreamController<List<Ingredients>?>.broadcast();

  Stream<List<Ingredients>?> get allIngredientStream =>
      _ingredientsStream.stream;

  Future<AppState> getIngredient() async {
    _ingredientsStream.add(null);
    selectedIngredients.clear();

    var responses = await getIngredientUsecase.call(NoParams());

    if (!responses.isError) {
      var data = (responses as LoadedState).data as List;
      _ingredients = data.map((datum) => Ingredients.fromJson(datum)).toList();
    } else {
      _ingredients = [];
    }

    _ingredientsStream.add(_ingredients);

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

  List<Recipe>? _recipes;
  List<Recipe>? get recipes => _recipes;

  final StreamController<List<Recipe>?> _recipeStream =
      StreamController<List<Recipe>?>.broadcast();

  Stream<List<Recipe>?> get allRecipesStream => _recipeStream.stream;

  Future<AppState> getRecipes() async {
    _recipeStream.add(null);

    var response = await getRecipeUsecase.call(selectedIngredients);

    if (!response.isError) {
      _recipes = ((response as LoadedState).data as List)
          .map((e) => Recipe.fromJson(e))
          .toList();
    } else {
      _recipes = [];
    }

    _recipeStream.add(_recipes);

    return response;
  }

  bool isDatePaased(Ingredients ingredient) {
    return DateTime.now().isAfter(ingredient.useBy);
  }
}
