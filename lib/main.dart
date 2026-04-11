import 'package:company_apg_2026/core/logic/shared_preferences.dart';
import 'package:company_apg_2026/pages/employer.dart';
import 'package:company_apg_2026/pages/home_page.dart';
import 'package:company_apg_2026/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'auth/account_dailog/account_dailog.dart';
import 'auth/create_login.dart';
import 'auth/login.dart';
import 'auth/otp_view.dart';
import 'core/logic/helper_methods.dart';
import 'core/them_project/get_theme_data_dark.dart';
import 'core/them_project/get_theme_data_light.dart';
import 'on_boarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await CashHelper.init();
 print('CashHelper');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primary = Color(0xff5A3A22);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: navKey,
          debugShowCheckedModeBanner: false,
          title: 'APG',
          theme: getThemeDataDark(),

          builder: (context, child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
          home: const SplashView(),
        );
      },
    );
  }
}
