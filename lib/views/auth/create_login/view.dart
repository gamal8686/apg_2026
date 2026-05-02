import 'package:company_apg_2026/core/components/app_back.dart';
import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/components/app_input.dart';
import 'package:company_apg_2026/core/components/app_login_or_register.dart';
import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:company_apg_2026/views/auth/create_login/state.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_validator.dart';
import '../../../core/logic/helper_methods.dart';
import '../../pages/home_page.dart';
import 'cubit.dart';

class CreateLoginView extends StatefulWidget {
  const CreateLoginView({super.key});

  @override
  State<CreateLoginView> createState() => _CreateLoginViewState();
}

class _CreateLoginViewState extends State<CreateLoginView> {
  late final cubit = context.read<CreateLoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppBack(pass: 'arrow-left.svg'),
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
          key: cubit.formKey,
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
                controller: cubit.name,
                label: 'الاسم ',
              ),
              AppInput(
                validator: InputValidator.phoneValidator,

                controller: cubit.email,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppImage(path: 'sms.svg', height: 24.h, width: 24.w),
                ),
                label: 'بريد إلكتروني',
              ),
              AppInput(
                validator: InputValidator.passwordValidator,
                controller: cubit.password,
                isKeyboardType: true,
                isPassword: true,
                label: 'كلمة المرور',
              ),
              AppInput(
                validator: InputValidator.passwordValidator,
                controller: cubit.newPassword,
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
              BlocBuilder<CreateLoginCubit, StateCreateLogin>(
                builder: (context, state) {
                  if (state is StateCreateLoginLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                    return AppButton(
                      text: 'تم التسجيل بنجاح',
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          print('1************');
                        cubit.sentData();

                        }},

                      width: 343.w,
                    );
                  }


              ),
            ],
          ),
        ),
      ),
    );
  }
}
