import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/components/app_input.dart';
import 'package:company_apg_2026/views/auth/forget_password/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_login_or_register.dart';
import '../../../core/components/app_validator.dart';
import '../../../core/logic/dio_helper.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(),
        child: Builder(
          builder: (context) {
            final cubit = context.read<ForgetPasswordCubit>();

            return Form(
              key: cubit.formKey,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      AppImage(
                        path: 'otp_Lock.jpg',
                        height: 200.h,
                        width: 200.w,
                      ),
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
                        controller: cubit.emailController,
                        validator: InputValidator.phoneValidator,
                        label: 'البريد الالكتروني',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: AppImage(
                            path: 'email.png',
                            height: 10.h,
                            width: 10.w,
                          ),
                        ),
                      ),
                      BlocBuilder<ForgetPasswordCubit, DataState>(
                        builder: (context, state) {
                          if (state == DataState.loading) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return AppButton(
                              text: 'استمرار',
                              width: 380.w,
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.sentData();
                                }
                              },
                            );
                          }
                        },
                      ),
                      SizedBox(height: 30.h),

                      AppLoginOrRegister(onPressed: () {}),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
