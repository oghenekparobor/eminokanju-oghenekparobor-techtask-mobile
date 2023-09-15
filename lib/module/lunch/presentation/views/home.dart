import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/config/route/route.dart';
import 'package:tech_task/core/di/injection_container.dart';
import 'package:tech_task/core/extension/app_state.dart';
import 'package:tech_task/core/extension/context.dart';
import 'package:tech_task/core/extension/widget.dart';
import 'package:tech_task/core/network/network_info.dart';
import 'package:tech_task/core/network/state.dart';
import 'package:tech_task/core/util/loader.dart';
import 'package:tech_task/core/widgets/notification.dart';
import 'package:tech_task/core/widgets/primary.dart';
import 'package:tech_task/module/lunch/data/models/ingredient.dart';
import 'package:tech_task/module/lunch/presentation/widgets/banner.dart';
import 'package:tech_task/module/lunch/presentation/widgets/date_picker.dart';
import 'package:tech_task/module/lunch/presentation/widgets/loader.dart';
import 'package:tech_task/module/lunch/presentation/widgets/tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Loader {
  bool hasError = false;
  bool hasGottenIngredient = false;
  bool initialFetch = false;

  @override
  void initState() {
    sl<NetworkInfo>().getConnectivity();

    super.initState();
  }

  void _init() {
    // there's no error
    setState(() => hasError = false);
    setState(() => initialFetch = true);

    // fetch all ingredients
    context.lunch.getIngredient().then((value) {
      if (value.isError) {
        // if there's an error show the error to user
        context.notify.addNotification(
          NotificationTile(message: (value as ErrorState).msg),
        );

        setState(() => hasError = true);
      } else {
        setState(() => hasGottenIngredient = true);
      }
    });
  }

  @override
  void dispose() {
    sl<NetworkInfo>().cancelInternetChecker();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: context.textTheme.displayMedium,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.verticalSpace,
          if (!hasError) ...[
            PrimaryButton(
              onTap: hasGottenIngredient
                  ? () {
                      if (context.lunch.selectedIngredients.isEmpty) {
                        context.notify.addNotification(
                          NotificationTile(
                            message: 'Please select at least one ingredient',
                          ),
                        );
                      } else {
                        context.nav.pushNamed(Routes.selectDate);
                      }
                    }
                  : _init,
              text: hasGottenIngredient ? 'Get Recipe' : 'Get Ingredients',
              alignment: Alignment.center,
              isLoading: isLoading,
            ).padHorizontal,
          ],
          30.verticalSpace,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyBanner(),
          15.verticalSpace,
          Text(
            'Ingredients',
            style: context.textTheme.bodyMedium,
          ),
          8.verticalSpace,
          PrimaryDatePicker(
            dateSelected: (d) {
              setState(() => hasGottenIngredient = false);
            },
          ),
          8.verticalSpace,
          Expanded(
            child: hasError
                ? Center(
                    child: TextButton(
                      onPressed: _init,
                      child: Text('Try Again'),
                    ),
                  )
                : SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: StreamBuilder<List<Ingredients>?>(
                      stream: context.lunch.allIngredientStream,
                      builder: (_, value) => LayoutBuilder(
                        builder: (context, constraints) => Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10.sp,
                            children: [
                              if (initialFetch) ...[
                                if (value.data == null) ...[
                                  for (int i = 0; i < 6; i++)
                                    MyShimmerLoader(
                                        height: 100.h, width: 100.w),
                                ] else ...[
                                  for (var ingredient in value.data ?? [])
                                    IngredientTile(
                                      constraints: constraints,
                                      ingredient: ingredient,
                                    ),
                                ],
                              ],
                            ]),
                      ),
                    ),
                  ),
          ),
        ],
      ).padHorizontal,
    );
  }
}
