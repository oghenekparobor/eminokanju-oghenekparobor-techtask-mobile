import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/core/extension/context.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    required this.message,
    super.key,
    this.error = false,
  });

  final String message;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      child: Dismissible(
        key: Key(message),
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          context.notify.removeNotification();
        },
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(
              top: context.padding.top * 1.2,
              left: 8.w,
              right: 8.w,
            ),
            padding: EdgeInsets.only(
              left: 8.w,
              top: 8.h,
              right: 8.w,
              bottom: 8.h,
            ),
            decoration: BoxDecoration(
              color: error ? Colors.red.shade100 : Colors.grey.shade100,
              border: Border.all(
                width: 2.w,
                color: Colors.black,
              ),
            ),
            child: Text(
              message,
              style: context.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
