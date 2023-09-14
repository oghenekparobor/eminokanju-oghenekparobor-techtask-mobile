import 'package:flutter/material.dart';
import 'package:tech_task/module/lunch/presentation/views/splash.dart';

class Routes {
  static const String home = '/';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case home:
      //   return MaterialPageRoute(
      //     builder: (_) => const GetStartedScree(),
      //     settings: settings,
      //   );
      

      default:
        return MaterialPageRoute(
          builder: (_) => const SplachScreen(),
          settings: settings,
        );
    }
  }
}
