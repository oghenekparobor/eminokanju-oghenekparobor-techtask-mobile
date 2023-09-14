import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/config/route/route.dart';
import 'package:tech_task/config/theme/theme.dart';
import 'package:tech_task/core/di/injection_container.dart';
import 'package:tech_task/core/extension/context.dart';
import 'package:tech_task/core/util/toast.dart';
import 'package:tech_task/module/lunch/presentation/change-notifier/lunch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // dependecies configuration
  await configureDependencies();

  runApp(MyApp());
}

GlobalKey<NavigatorState> navkey = GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: sl<LunchNotifier>()),
        ],
        child: MaterialApp(
          title: 'Recipe App',
          theme: theme(context),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
          builder: (context, child) {
            final MediaQueryData query = MediaQuery.of(context);
            final double scale = query.textScaleFactor.clamp(0.99, 1.0);

            final MediaQueryData mediaQuery = context.mediaQuery.copyWith(
              textScaleFactor: scale,
            );

            return MediaQuery(
              data: mediaQuery,
              child: NotificationStack(child: child!),
            );
          },
        ),
      ),
    );
  }
}
