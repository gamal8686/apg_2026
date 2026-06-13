import 'package:company_apg_2026/core/logic/shared_preferences.dart';
import 'package:company_apg_2026/splash.dart';
import 'package:company_apg_2026/views/auth/Create_Login/cubit.dart';
import 'package:company_apg_2026/views/auth/create_login/view.dart';
import 'package:company_apg_2026/views/auth/forget_password/cubit.dart';
import 'package:company_apg_2026/views/auth/login/cubit.dart';
import 'package:company_apg_2026/views/auth/new_password/cubit.dart';
import 'package:company_apg_2026/views/auth/otp_view/cubit.dart';
import 'package:company_apg_2026/views/pages/car/add_car/cubit.dart';
import 'package:company_apg_2026/views/pages/car/car/cubit.dart';
import 'package:company_apg_2026/views/pages/car/details_car/cubit.dart';
import 'package:company_apg_2026/views/pages/category/view.dart';
import 'package:company_apg_2026/views/pages/employer/add/cubit.dart';
import 'package:company_apg_2026/views/pages/employer/add/view.dart';
import 'package:company_apg_2026/views/pages/employer/edite/cubit.dart';
import 'package:company_apg_2026/views/pages/employer/employer/cubit.dart';
import 'package:company_apg_2026/views/pages/employer/employer_details/cubit.dart';
import 'package:company_apg_2026/views/pages/employer/employer_details/view.dart';
import 'package:company_apg_2026/views/pages/employer/holidays/add/cubit.dart';
import 'package:company_apg_2026/views/pages/employer/holidays/holiday/cubit.dart';
import 'package:company_apg_2026/views/pages/home_page/cubit.dart';
import 'package:company_apg_2026/views/pages/order/add_order/cubit.dart';
import 'package:company_apg_2026/views/pages/order/order/cubit.dart';
import 'package:company_apg_2026/views/pages/products/add_products/cubit.dart';
import 'package:company_apg_2026/views/pages/products/items_management/cubit.dart';
import 'package:company_apg_2026/views/pages/products/product_location/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/components/app_them_project/cubit_theme.dart';
import 'core/components/app_them_project/get_theme_data_dark.dart';
import 'core/components/app_them_project/get_theme_data_light.dart';
import 'core/components/app_them_project/state_theme.dart';
import 'core/logic/helper_methods.dart';
import 'core/service/service_locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();



  await Supabase.initialize(
    url: 'https://eksdncdxluuukcrbzkdd.supabase.co',
    anonKey: 'sb_publishable_l3g9xl2Ddx1EYOmLotDX6A_IMIlXOkx',
  );
  initGetIt();

  await CashHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              themeAnimationCurve: Curves.easeInOut,
              themeAnimationDuration: Duration(milliseconds: 700),
              builder: (context, child) => Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              ),
              home: BlocProvider(
                create: (_) => box<CreateLoginCubit>(),
                child:    SplashView(),
              ),
            ),
          ),
        );
      },
    );
  }
}
