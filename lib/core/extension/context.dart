import 'package:flutter/material.dart';
import 'package:tech_task/core/di/injection_container.dart';
import 'package:tech_task/core/util/toast.dart';
import 'package:tech_task/module/lunch/presentation/change-notifier/lunch.dart';

extension CxtExtension on BuildContext {
  // theme related
  ThemeData get theme => Theme.of(this);
  AppBarTheme get appbarTheme => AppBarTheme.of(this);
  DialogTheme get dialogTheme => DialogTheme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  TabBarTheme get tabbarTheme => Theme.of(this).tabBarTheme;

  // size related
  Size get size => MediaQuery.of(this).size;
  EdgeInsets get padding => MediaQuery.of(this).padding;

  // navigator related
  NavigatorState get nav => Navigator.of(this);

  // focus scope
  FocusScopeNode get focusScope => FocusScope.of(this);

  // notification
  NotificationStackState get notify => NotificationStack.of(this);

  // media queries
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // view models
  LunchNotifier get auth => sl<LunchNotifier>();

  Object get arg => ModalRoute.of(this)!.settings.arguments!;
}
