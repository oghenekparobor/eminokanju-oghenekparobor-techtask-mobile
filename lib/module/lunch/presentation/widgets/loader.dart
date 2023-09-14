import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tech_task/core/constants-n-assets/assets.dart';

class MyShimmerLoader extends StatelessWidget {
  const MyShimmerLoader({
    super.key,
    required this.height,
    required this.width,
    this.rightMargin = false,
  });

  final double width;
  final double height;
  final bool rightMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(bottom: 8.h, right: rightMargin ? 8.w : 0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.grey.shade300,
        child: Image.asset(
          kPlaceholder,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
