import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/components/app_input.dart';
import 'package:company_apg_2026/core/components/app_login_or_register.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/core/logic/shared_preferences.dart';
import 'package:company_apg_2026/views/auth/Create_Login/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_validator.dart';
import '../../../core/logic/dio_helper.dart';
import '../../pages/home_page.dart';
import '../Create_Login/view.dart';
import 'cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4E4E4),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: Builder(
          builder: (context) {
            final cubit = context.read<LoginCubit>();

            return SingleChildScrollView(
              padding: EdgeInsetsGeometry.all(15.w),

              child: Form(
                key: cubit.fromKey,
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    ClipOval(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: AppImage(
                        fit: BoxFit.cover,
                        path: 'log.png',
                        height: 100.h,
                        width: 120.w,
                      ),
                    ),
                    Text(
                      'تسجيل الدخول',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 24.h),
                    Text(
                      'لتسجيل الدخول إلى حسابك في التطبيق، أدخل بريدك\nالإلكتروني وكلمة المرور.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    AppInput(
                      controller: cubit.email,
                      validator: InputValidator.phoneValidator,

                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppImage(
                          path: 'email.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      label: 'بريد إلكتروني',
                    ),
                    AppInput(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppImage(
                          path: 'password.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      controller: cubit.password,
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
                    SizedBox(height: 15.h),

                    BlocBuilder<LoginCubit, DataState>(
                      builder: (context, state) {
                        if (state == DataState.loading) {
                          return CircularProgressIndicator();
                        }
                        return AppButton(
                          text: 'تسجيل الدخول',
                          width: 343.w,
                          onPressed: () {
                            if (cubit.fromKey.currentState!.validate()) {
                             cubit.sentData();
                              print('success');
                              goTo(HomePage());
                            } else {
                              print('failed');
                              goTo(CreateLoginView());
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: 15.h),

                    AppLoginOrRegister(onPressed: () {}),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
