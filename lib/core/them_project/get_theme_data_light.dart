import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/app_color.dart';

ThemeData getThemeDataLight = ThemeData(
  fontFamily: 'Montserrat',
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColorThemeDark.colorSchemeColor,
  ),
  scaffoldBackgroundColor: AppColorThemeDark.scaffoldBackgroundColor,
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 16, color: AppColorThemeDark.textThemeColor),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColorThemeDark.textThemeColor,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColorThemeDark.textThemeColor,
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      fixedSize: Size.fromHeight(56.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      backgroundColor: AppColorThemeDark.floatingThemeColor,
    ),
  ),
  appBarTheme: AppBarTheme(backgroundColor: AppColorThemeDark.appBarThemeColor),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColorThemeDark.textButtonThemeColor,
    ),
  ),

  cardColor: AppColorThemeDark.cardColor.withValues(alpha: .50),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColorThemeDark.inputDecorationThemeColor.withValues(
      alpha: .40,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColorThemeDark.inputDecorationThemeBorderRadiusColor
            .withValues(alpha: 0.040),
      ),
    ),
  ),
);
