import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/core/extension/context.dart';
import 'package:tech_task/core/extension/widget.dart';
import 'package:tech_task/core/widgets/primary.dart';
import 'package:tech_task/core/widgets/text_field.dart';
import 'package:tech_task/module/lunch/presentation/widgets/loader.dart';
import 'package:tech_task/module/lunch/presentation/widgets/rtile.dart';

class ReceiptDate extends StatelessWidget {
  const ReceiptDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date'),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,
              Wrap(
                children: [
                  for (var _ in [0, 0, 0, 0])
                    Padding(
                      padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
                      child: Text(
                        'Lorem ipsum',
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                ],
              ),
              16.verticalSpace,
              PrimaryTextfield(
                onChanged: (p0) {},
                onSaved: (p0) {},
                validator: (p0) {},
                hint: 'Select lunch date',
                onTap: () {},
                readOnly: true,
              ),
              8.verticalSpace,
              PrimaryButton(
                onTap: () {},
                text: 'Show Recipes',
              ),
              30.verticalSpace,
              Text(
                'Recipes',
                style: context.textTheme.bodyMedium,
              ),
              16.verticalSpace,
            ],
          ).padHorizontal,
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => PageView(
                padEnds: true,
                pageSnapping: true,
                controller: PageController(
                  viewportFraction: .75,
                ),
                children: [
                  if (context.lunch.recipes == null) ...[
                    for (int i = 0; i < 6; i++)
                      MyShimmerLoader(
                        height: 100.h,
                        width: 100.w,
                        rightMargin: true,
                      ),
                  ] else ...[
                    for (var _ in [0, 0, 0, 0])
                      RecipeTile(constraints: constraints),
                  ],
                ],
              ),
            ),
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}
