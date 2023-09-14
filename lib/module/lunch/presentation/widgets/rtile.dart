
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/core/extension/context.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            'Lorem Ipsum',
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp,
              color: Colors.teal,
            ),
          ),
          30.verticalSpace,
          Text('Ingredients'),
          Divider(),
          12.verticalSpace,
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                '* Ingredients\n* Data',
                style: context.textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
