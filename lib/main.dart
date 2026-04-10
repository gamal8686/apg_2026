import 'package:company_apg_2026/pages/employer.dart';
import 'package:company_apg_2026/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'auth/create_login.dart';
import 'auth/login.dart';
import 'auth/otp_view.dart';
import 'core/logic/helper_methods.dart';
import 'on_boarding.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final primary = Color(0xff5A3A22);
    final primarySwatch = MaterialColor(primary.value, {
      50: primary.withValues(alpha: .1),
      100: primary.withValues(alpha: .2),
      200: primary.withValues(alpha: .3),
      300: primary.withValues(alpha: .4),
      400: primary.withValues(alpha: .5),
      500: primary,
      600: primary.withValues(alpha: .6),
      700: primary.withValues(alpha: .7),
      800: primary.withValues(alpha: .8),
      900: primary,
    });
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: navKey,
          debugShowCheckedModeBanner: false,
          title: 'APG',
          theme: ThemeData(

            textTheme: TextTheme(
              bodyMedium: TextStyle(
                fontSize: 14.sp,
                wordSpacing: 0,
                letterSpacing: 2,
                color: Color(0xff5A3A22).withValues(alpha: .40),
              ),
            ),

            fontFamily: 'Montserrat',
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                fixedSize: Size.fromHeight(56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                backgroundColor: Color(0xff5A3A22),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              fillColor: Color(0xff5a669066).withValues(alpha: .40),
              enabledBorder: OutlineInputBorder(

                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Color(0xff5a669066).withValues(alpha: 0.040),
                ),
              ),
            ),
            appBarTheme: AppBarTheme(color: Color(0xff5A3A22)),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch),

            cardColor: Color(0xff5A3A22).withValues(alpha: .50),
            scaffoldBackgroundColor: Color(0xffD9D9D9),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Color(0xff5A3A22)),
            ),
          ),
          builder: (context, child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
        home: const LoginView(),
        );


      },
    );
  }
}
