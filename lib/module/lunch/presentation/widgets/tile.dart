import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/core/constants-n-assets/assets.dart';
import 'package:tech_task/core/extension/context.dart';
import 'package:tech_task/module/lunch/data/models/ingredient.dart';
import 'package:tech_task/module/lunch/presentation/change-notifier/lunch.dart';

class IngredientTile extends StatelessWidget {
  const IngredientTile({
    super.key,
    required this.constraints,
    required this.ingredient,
  });

  final BoxConstraints constraints;
  final Ingredients ingredient;

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      child: InkWell(
        onTap: () {
          context.lunch.addRemoveIngredient(ingredient);
        },
        child: Container(
          margin: EdgeInsets.only(
            bottom: 8.h,
            top: 8.h,
            right: 2.w,
            left: 2.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              if (context
                  .watch<LunchNotifier>()
                  .isIngredientSelected(ingredient)) ...[
                BoxShadow(
                  color: Colors.red,
                  blurRadius: 10,
                  spreadRadius: .1,
                ),
              ],
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: (constraints.maxWidth / 4.1).w,
                height: 70.h,
                child: Image.asset(
                  kPlaceholder1,
                  fit: BoxFit.cover,
                ),
              ),
              4.verticalSpace,
              Text(
                ingredient.title,
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 11.sp,
                ),
              ),
              8.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
