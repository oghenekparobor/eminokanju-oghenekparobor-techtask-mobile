import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/core/extension/context.dart';

ThemeData theme(BuildContext context) => ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        bodySmall: TextStyle(
          color: const Color(0xFF0E0E0D),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontSize: 13.sp,
          fontFamily: 'SKCuriosityRounded',
        ),
        displayLarge: TextStyle(
          color: const Color(0xFF0E0E0D),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 40.sp,
          fontFamily: 'SKCuriosityRounded',
        ),
        bodyMedium: TextStyle(
          color: const Color(0xFF0E0E0D),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontSize: 16.sp,
          fontFamily: 'SKCuriosityRounded',
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: const Color(0xFF0E0E0D),
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontFamily: 'SKCuriosityRounded',
          fontSize: 24.sp,
        ),
        labelMedium: TextStyle(
          color: const Color(0xFF0E0E0D),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'SKCuriosityRounded',
        ),
      ),
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Color(0xFFF7F7F7),
      colorScheme: Theme.of(context).colorScheme.copyWith(
            secondary: Colors.black,
            primary: Colors.black,
          ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: Color(0xFF373737),
          ),
        ),
        buttonColor: const Color(0xFF373737),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        textTheme: ButtonTextTheme.primary,
        disabledColor: Colors.grey,
      ),
      canvasColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      primaryIconTheme: const IconThemeData(color: Colors.black),
      cardTheme: CardTheme(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: const Color(0xFF373737), width: 1.sp),
        ),
        elevation: 0,
      ),
      dialogTheme: context.dialogTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: const Color(0xFF373737), width: 1.sp),
        ),
      ),
      appBarTheme: context.appbarTheme.copyWith(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Color(0xFF373737)),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: const Color(0xFF373737),
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        hintStyle: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontSize: 14,
          height: 1.6,
        ),
      ),
      tabBarTheme: context.tabbarTheme.copyWith(
        labelColor: const Color(0xFF373737),
        labelStyle: const TextStyle(
          height: 1.0,
          color: Colors.black87,
          fontFamily: 'SKCuriosityRounded',
        ),
        unselectedLabelColor: Colors.black87,
      ),
      datePickerTheme: DatePickerThemeData(
        headerBackgroundColor: Colors.black,
        rangePickerBackgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            width: 2.w,
            color: Colors.black,
          ),
        ),
        dayStyle: TextStyle(
          color: const Color(0xFF0E0E0D),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontSize: 16.sp,
          fontFamily: 'SKCuriosityRounded',
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        headerHeadlineStyle: TextStyle(
          color: const Color(0xFF0E0E0D),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontSize: 18.sp,
          fontFamily: 'SKCuriosityRounded',
          fontWeight: FontWeight.bold,
        ),
        todayBorder: BorderSide(
          color: Colors.black,
          width: 2.w,
        ),
        rangePickerShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            width: 2.w,
            color: Colors.black,
          ),
        ),
      ),
    );
