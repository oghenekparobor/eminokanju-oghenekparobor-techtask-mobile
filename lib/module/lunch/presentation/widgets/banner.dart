import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/core/constants-n-assets/assets.dart';
import 'package:tech_task/core/extension/context.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        30.verticalSpace,
        Text(
          'Recipe of the week',
          style: context.textTheme.bodyMedium,
        ),
        8.verticalSpace,
        ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Image.asset(kPlaceholder1),
        ),
        8.verticalSpace,
        Text(
          'Lorem Ipsum',
          style: context.textTheme.bodySmall,
        ),
        8.verticalSpace,
        Row(
          children: [
            Icon(Icons.timer_outlined),
            4.horizontalSpace,
            Text(
              '45mins',
              style: context.textTheme.bodySmall,
            ),
            8.horizontalSpace,
            Icon(Icons.align_horizontal_center_rounded),
            4.horizontalSpace,
            Text(
              'Easy',
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
