import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/core/di/injection_container.dart';
import 'package:tech_task/core/extension/app_state.dart';
import 'package:tech_task/core/extension/context.dart';
import 'package:tech_task/core/extension/widget.dart';
import 'package:tech_task/core/network/network_info.dart';
import 'package:tech_task/core/network/state.dart';
import 'package:tech_task/core/util/loader.dart';
import 'package:tech_task/core/widgets/notification.dart';
import 'package:tech_task/core/widgets/primary.dart';
import 'package:tech_task/module/lunch/presentation/widgets/loader.dart';
import 'package:tech_task/module/lunch/presentation/widgets/rtile.dart';

class ReceiptDate extends StatefulWidget {
  const ReceiptDate({super.key});

  @override
  State<ReceiptDate> createState() => _ReceiptDateState();
}

class _ReceiptDateState extends State<ReceiptDate> with Loader {
  bool initialLoding = false;

  @override
  void initState() {
    sl<NetworkInfo>().getConnectivity();

    super.initState();
  }

  @override
  void dispose() {
    sl<NetworkInfo>().cancelInternetChecker();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('recipe_screen'),
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
              Padding(
                padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
                child: Text(
                  context.lunch.selectedIngredients.join(', '),
                  style: context.textTheme.bodyMedium,
                ),
              ),
              16.verticalSpace,
              PrimaryButton(
                onTap: () async {
                  setState(() => initialLoding = true);
                  toggleLoader();
                  await context.lunch.getRecipes().then((value) {
                    if (value.isError) {
                      context.notify.addNotification(
                        NotificationTile(message: (value as ErrorState).msg),
                      );
                    }

                    toggleLoader();
                  });
                },
                text: 'Show Recipes',
                isLoading: isLoading,
                widgetKey: 'show_recipe_button',
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
            child: StreamBuilder(
              stream: context.lunch.allRecipesStream,
              builder: (_, value) => LayoutBuilder(
                builder: (context, constraints) => PageView(
                  padEnds: true,
                  pageSnapping: true,
                  controller: PageController(
                    viewportFraction: .75,
                  ),
                  children: [
                    if (initialLoding) ...[
                      if (value.data == null) ...[
                        for (int i = 0; i < 6; i++)
                          MyShimmerLoader(
                            height: 100.h,
                            width: 100.w,
                            rightMargin: true,
                          ),
                      ] else ...[
                        for (var recipe in value.data ?? [])
                          RecipeTile(
                            constraints: constraints,
                            recipe: recipe,
                          ),
                      ],
                    ]
                  ],
                ),
              ),
            ),
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}
