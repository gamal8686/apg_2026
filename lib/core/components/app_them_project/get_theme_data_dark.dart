import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/app_color.dart';


ThemeData getThemeDataDark = ThemeData(
  fontFamily: 'Montserrat',
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColorThemeLight.colorSchemeColor,
  ),
  scaffoldBackgroundColor: AppColorThemeLight.scaffoldBackgroundColor,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      color: AppColorThemeLight.textThemeColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColorThemeLight.textThemeColor,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColorThemeLight.textThemeColor,
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      fixedSize: Size.fromHeight(56.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      backgroundColor: AppColorThemeLight.floatingThemeColor,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColorThemeLight.appBarThemeColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColorThemeLight.textButtonThemeColor,
    ),
  ),

  cardColor: AppColorThemeLight.cardColor.withValues(alpha: .50),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColorThemeLight.inputDecorationThemeColor.withValues(
      alpha: .40,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColorThemeLight.inputDecorationThemeBorderRadiusColor
            .withValues(alpha: 0.040),
      ),
    ),
  ),
);
