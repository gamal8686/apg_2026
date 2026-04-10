import 'package:company_apg_2026/auth/login.dart';
import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/components/app_input.dart';
import 'package:company_apg_2026/core/components/app_login_or_register.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/components/app_validator.dart';

class CreateLoginView extends StatefulWidget {
  const CreateLoginView({super.key});

  @override
  State<CreateLoginView> createState() => _CreateLoginViewState();
}

class _CreateLoginViewState extends State<CreateLoginView> {
  final name = TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();

  final newPassword = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppImage(path: 'arrow-left.svg'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'إنشاء حساب',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff1E1E1E),
            fontFamily: 'Cairo',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(15.w),
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Text(
                'إنشاء حساب',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1E1E1E),
                ),
              ),
              SizedBox(height: 20.h),

              AppInput(
                validator: InputValidator.phoneValidator,
                controller: name,
                label: 'الاسم ',
              ),
              AppInput(
                validator: InputValidator.phoneValidator,

                controller: email,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppImage(path: 'sms.svg', height: 24.h, width: 24.w),
                ),
                label: 'بريد إلكتروني',
              ),
              AppInput(
                validator: InputValidator.passwordValidator,
                controller: password,
                isKeyboardType: true,
                isPassword: true,
                label: 'كلمة المرور',
              ),
              AppInput(
                validator: InputValidator.passwordValidator,
                controller: newPassword,
                isKeyboardType: true,
                isPassword: true,
                label: 'تأكيد كلمة المرور',
              ),
              Row(
                children: [
                  Checkbox(onChanged: (value) {}, value: true),
                  SizedBox(width: 8.w),
                  Text(
                    'أوافق على شروط الاستخدام',
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
                text: 'سجل الآن',
                onPressed: () {
                 // if (fromKey.currentState!.validate()) {
                    goTo(HomePage());
                 // }
                },
                width: 343.w,
              ),
              AppLoginOrRegister(isLogin: false, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
