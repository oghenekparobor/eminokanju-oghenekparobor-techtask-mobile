import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/core/extension/context.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onTap,
    required this.text,
    super.key,
    this.alignment,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onTap;
  final Alignment? alignment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            color: isLoading ? Colors.grey.shade500 : Colors.black,
          ),
          alignment: alignment,
          child: isLoading
              ? SizedBox(
                  width: 18.sp,
                  height: 18.sp,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 2.w,
                  ),
                )
              : Text(
                  text,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
