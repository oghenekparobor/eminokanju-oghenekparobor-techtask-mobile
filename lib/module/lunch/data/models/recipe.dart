import 'package:tech_task/module/lunch/domain/entities/recipe.dart';

class Recipe extends RecipeEntity {
  Recipe({
    required super.ingredients,
    required super.title,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      ingredients: json['ingredients'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
        'ingredients': ingredients,
        'title': title,
      };
}
