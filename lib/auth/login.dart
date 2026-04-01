import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/components/app_input.dart';
import 'package:company_apg_2026/core/components/app_login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/components/app_validator.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final email = TextEditingController();
  final password = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(15.w),

        child: Form(
          key: fromKey,
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Text(
                'مرحبًا بعودتك !',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24.h),
              AppInput(
                controller: email,
                validator: InputValidator.phoneValidator,

                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppImage(path: 'sms.svg', height: 24.h, width: 24.w),
                ),
                label: 'بريد إلكتروني',
              ),
              AppInput(
                controller: password,
                validator: InputValidator.passwordValidator,

                isKeyboardType: true,
                isPassword: true,
                label: 'كلمة المرور',
              ),
              Row(
                children: [
                  Checkbox(onChanged: (value) {}, value: true),

                  Spacer(),
                  Text(
                    'هل نسيت كلمة المرور؟',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4E4E4E),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              AppButton(
                text: 'تسجيل الدخول',
                width: 343.w,
                onPressed: () {
                  if (fromKey.currentState!.validate()) {}
                },
              ),
              SizedBox(height: 30.h),

              AppLoginOrRegister(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
