import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/components/app_input.dart';
import '../../core/components/app_login_or_register.dart';

class AlreadyPasswordView extends StatelessWidget {
  const AlreadyPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppImage(path: 'success_otp.jpg', height: 250.h, width: 250.w),
              SizedBox(height: 50.h),
              Text(
                'تم إعادة ضبط كلمة المرور بنجاح',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Text(
                textAlign: TextAlign.center,
                'أدخل رمز التحقق (OTP) المرسل إلى +1020924779 \n'
                    'على رقم الهاتف.',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 15.h),


              AppButton(text: 'تسجيل الدخول', onPressed: () {}, width: 380.w),
              SizedBox(height: 30.h),

              AppLoginOrRegister(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
