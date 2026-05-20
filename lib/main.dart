import 'package:company_apg_2026/core/logic/shared_preferences.dart';
import 'package:company_apg_2026/splash.dart';
import 'package:company_apg_2026/views/auth/Create_Login/cubit.dart';
import 'package:company_apg_2026/views/auth/forget_password/cubit.dart';
import 'package:company_apg_2026/views/auth/login/cubit.dart';
import 'package:company_apg_2026/views/auth/new_password/cubit.dart';
import 'package:company_apg_2026/views/auth/otp_view/cubit.dart';
import 'package:company_apg_2026/views/pages/car/add_car/cubit.dart';
import 'package:company_apg_2026/views/pages/car/add_car/view.dart';
import 'package:company_apg_2026/views/pages/car/car/cubit.dart';
import 'package:company_apg_2026/views/pages/car/details_car/cubit.dart';
import 'package:company_apg_2026/views/pages/car/details_car/view.dart';
import 'package:company_apg_2026/views/pages/category/category.dart';
import 'package:company_apg_2026/views/pages/employer/add/cubit.dart';

import 'package:company_apg_2026/views/pages/employer/employer/view.dart';
import 'package:company_apg_2026/views/pages/home_page.dart';
import 'package:company_apg_2026/views/pages/products/add_products/view.dart';
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
          BlocProvider(create: (context) => CarCubit()),
          BlocProvider(create: (context) => AddCarCubit()),
          BlocProvider(create: (context) => DetailsCarCubit()..getData()),
          BlocProvider(create: (context) => AddEmployerCubit()),
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
                home: const CategoryPage(),
              ),
            ),
          );
        },
      ),
    );
  }
}
