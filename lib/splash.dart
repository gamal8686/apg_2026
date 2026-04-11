import 'dart:async';


import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/core/logic/shared_preferences.dart';
import 'package:company_apg_2026/views/auth/login.dart';
import 'package:company_apg_2026/views/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'on_boarding.dart';

class SplashView extends StatefulWidget {


  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    goTo( CashHelper.getIsNotFirst?OnBoardingView():CashHelper.isAuth?HomePage():LoginView(), delayDuration: 3);

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: AppImage(path: 'splash.png')),
    );
  }
}




