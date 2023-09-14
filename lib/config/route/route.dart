import 'package:flutter/material.dart';
import 'package:tech_task/module/lunch/presentation/views/recipe.dart';
import 'package:tech_task/module/lunch/presentation/views/splash.dart';

class Routes {
  static const String selectDate = '/select';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case selectDate:
        return MaterialPageRoute(
          builder: (_) => const ReceiptDate(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplachScreen(),
          settings: settings,
        );
    }
  }
}
