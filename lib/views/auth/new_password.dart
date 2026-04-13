import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/components/app_input.dart';
import '../../core/components/app_login_or_register.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppImage(path: 'log_ok.jpg', height: 150.h, width: 150.w),
              SizedBox(height: 50.h),
              Text(
                'التحقق من رمز التحقق',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                textAlign: TextAlign.center,
                'أدخل رمز التحقق (OTP) المرسل إلى الايميل الخاص\n'
                    'بك علي الفور.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15.h),
              AppInput(
                isKeyboardType: true,
                label: 'كلمه المرور الجديده',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppImage(path: 'password.png', height: 10.h, width: 10.w),
                ),
              ),
              SizedBox(height: 15.h),
              AppInput(
                isKeyboardType: true,
                label: 'تاكيد كلمه المرور',

                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppImage(path: 'password.png', height: 10.h, width: 10.w),
                ),
              ),
              SizedBox(height: 15.h),
              AppButton(text: 'إعادة ضبط كلمة المرور', onPressed: () {}, width: 380.w),
              SizedBox(height: 30.h),

              AppLoginOrRegister(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
