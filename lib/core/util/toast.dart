import 'package:flutter/material.dart';

class Notification {
  final String message;

  Notification(this.message);
}

class NotificationStack extends StatefulWidget {
  final Widget child;

  const NotificationStack({
    required this.child,
    super.key,
  });

  static NotificationStackState of(BuildContext context) {
    return context.findAncestorStateOfType<NotificationStackState>()!;
  }

  @override
  NotificationStackState createState() => NotificationStackState();
}

class NotificationStackState extends State<NotificationStack> {
  late List<Widget> _notificationStack;

  @override
  void initState() {
    super.initState();

    _notificationStack = [];
  }

  void addNotification(Widget notification, {int? howLong}) {
    setState(() {
      _notificationStack.add(notification);
    });

    Future.delayed(Duration(seconds: howLong ?? 7), removeNotification);
  }

  void removeNotification() {
    setState(() {
      if (_notificationStack.isNotEmpty) {
        _notificationStack.removeAt(_notificationStack.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        ..._notificationStack,
      ],
    );
  }
}

