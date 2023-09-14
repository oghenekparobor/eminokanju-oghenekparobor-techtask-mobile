import 'package:equatable/equatable.dart';

class IngredientEntity extends Equatable {
  IngredientEntity({
    required this.title,
    required this.useBy,
  });

  final String title;
  final DateTime useBy;

  @override
  List<Object?> get props => [title, useBy];
}
