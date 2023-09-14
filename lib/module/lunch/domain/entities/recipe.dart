import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  RecipeEntity({
    required this.ingredients,
    required this.title,
  });

  final String title;
  final List ingredients;

  @override
  List<Object?> get props => [
        title,
        ingredients,
      ];
}
