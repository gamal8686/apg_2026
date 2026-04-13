import 'package:company_apg_2026/core/logic/shared_preferences.dart';

import 'package:company_apg_2026/splash.dart';
import 'package:company_apg_2026/views/auth/forget_password.dart';
import 'package:company_apg_2026/views/auth/login.dart';
import 'package:company_apg_2026/views/auth/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cubit/them_project/cubit_theme.dart';
import 'core/cubit/them_project/get_theme_data_dark.dart';
import 'core/cubit/them_project/get_theme_data_light.dart';
import 'core/cubit/them_project/state_theme.dart';
import 'core/logic/helper_methods.dart';


void main() async {
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
        return BlocProvider(
          create: (context) => CubitTheme(),
          child: BlocBuilder<CubitTheme, StateTheme>(
            builder: (context, state) => MaterialApp(
              navigatorKey: navKey,
              debugShowCheckedModeBanner: false,
              title: 'APG',
              theme: getThemeDataLight,
              darkTheme: getThemeDataDark,
              themeMode: CubitTheme.get(context).getTheme(),

              builder: (context, child) => Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              ),
              home: const ForgetPasswordView(),
            ),
          ),
        );
      },
    );
  }
}
