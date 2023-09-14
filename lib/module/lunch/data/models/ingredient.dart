import 'package:tech_task/module/lunch/domain/entities/ingredient.dart';

class Ingredients extends IngredientEntity {
  Ingredients({
    required super.title,
    required super.useBy,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      title: json['title'],
      useBy: DateTime.parse(json['use-by']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'use-by': useBy.toIso8601String(),
      };
}
