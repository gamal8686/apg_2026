import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/components/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_login_or_register.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppImage(path: 'otp_Lock.jpg', height: 200.h, width: 200.w),
              SizedBox(height: 50.h),
              Text(
                'نسيت كلمة المرور',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                textAlign: TextAlign.center,
                'أدخل الايميل الشخصي وسنرسل لك رمز التحقق (OTP)\n'
                'لإعادة ضبط كلمة المرور.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15.h),
              AppInput(
                label: 'البريد الالكتروني',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppImage(path: 'email.png', height: 10.h, width: 10.w),
                ),
              ),
              SizedBox(height: 15.h),
              AppButton(text: 'استمرار', onPressed: () {}, width: 380.w),
              SizedBox(height: 30.h),

              AppLoginOrRegister(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
