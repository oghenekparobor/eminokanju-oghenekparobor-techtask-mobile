import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/core/extension/context.dart';

class NetowrkMessage extends StatelessWidget {
  const NetowrkMessage({
    super.key,
    this.error = false,
  });

  final bool error;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideInUp(
        child: Dismissible(
          key: Key(DateTime.now().toIso8601String()),
          direction: DismissDirection.down,
          onDismissed: (_) {
            context.notify.removeNotification();
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.only(
                top: context.padding.top * 1.2,
                bottom: context.padding.bottom * 1.2,
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
                color: error ? Colors.red.shade100 : Colors.green.shade100,
                border: Border.all(
                  width: 2.w,
                  color: error ? Colors.red : Colors.green,
                ),
              ),
              child: Text(
                error
                    ? 'Connection lost...Please check internet connection'
                    : 'Connection is back.',
                style: context.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
