import 'package:company_apg_2026/core/logic/shared_preferences.dart';
import 'package:company_apg_2026/views/auth/Create_Login/cubit.dart';
import 'package:company_apg_2026/views/auth/Create_Login/view.dart';
import 'package:company_apg_2026/views/auth/already_password/view.dart';
import 'package:company_apg_2026/views/auth/forget_password/cubit.dart';
import 'package:company_apg_2026/views/auth/forget_password/view.dart';
import 'package:company_apg_2026/views/auth/login/cubit.dart';
import 'package:company_apg_2026/views/auth/login/view.dart';
import 'package:company_apg_2026/views/auth/new_password/cubit.dart';
import 'package:company_apg_2026/views/auth/new_password/view.dart';
import 'package:company_apg_2026/views/auth/otp_view/cubit.dart';
import 'package:company_apg_2026/views/auth/otp_view/view.dart';
import 'package:company_apg_2026/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/components/app_them_project/cubit_theme.dart';
import 'core/components/app_them_project/get_theme_data_dark.dart';
import 'core/components/app_them_project/get_theme_data_light.dart';
import 'core/components/app_them_project/state_theme.dart';
import 'core/logic/helper_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Color(0xff5A3A22);

    return MultiBlocProvider(
      providers: [
          BlocProvider(create: (context) => CreateLoginCubit()),
          BlocProvider(create: (context) => ForgetPasswordCubit()),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => NewPasswordCubit()),
          BlocProvider(create: (context) => OtbCubit()),
      ],
      child: ScreenUtilInit(
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
                themeAnimationCurve: Curves.easeInOut,
                  themeAnimationDuration: Duration(milliseconds: 700),
                builder: (context, child) => Directionality(
                  textDirection: TextDirection.rtl,
                  child: child!,
                ),
                home: const OtpView(),
              ),
            ),
          );
        },
      ),
    );
  }
}
