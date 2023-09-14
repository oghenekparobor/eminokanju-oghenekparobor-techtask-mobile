import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/core/constants-n-assets/assets.dart';
import 'package:tech_task/core/extension/context.dart';
import 'package:tech_task/module/lunch/data/models/recipe.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({
    super.key,
    required this.constraints,
    required this.recipe,
  });

  final BoxConstraints constraints;
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      child: Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth * .5,
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(kPlaceholder1),
            16.verticalSpace,
            Text(
              recipe.title,
              style: context.textTheme.bodyMedium!.copyWith(
                fontSize: 14.sp,
                color: Colors.teal,
              ),
            ),
            30.verticalSpace,
            Text(
              'Ingredients',
              style: context.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            12.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  recipe.ingredients.join('\n'),
                  style: context.textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
