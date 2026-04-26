import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_otp.dart';
import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:company_apg_2026/views/auth/otp_view/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_image.dart';
import '../../../core/components/app_validator.dart';
import '../../../core/logic/helper_methods.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

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
          'يجب التحقق من حسابك',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff1E1E1E),
            fontFamily: 'Cairo',
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => OtbCubit(),
        child: Builder(
          builder: (context) {
            final cubit = context.read<OtbCubit>();

            return SingleChildScrollView(
              padding: EdgeInsetsDirectional.all(15.w),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    AppImage(path: 'otp_view.png', height: 150.h, width: 150.w),
                    SizedBox(height: 20.h),

                    Text(
                      '   يرجى إدخال الرمز المكون من 6 أرقام الذي أرسلناه \nإلى بريدك الإلكتروني ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff1E1E1E).withValues(alpha: .40),
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Text('Ahmed@gmail.com.'),
                    SizedBox(height: 20.h),
                    AppOtp(
                      validator: InputValidator.phoneValidator,
                      controller: cubit.otpController,
                    ),
                    SizedBox(height: 32.h),

                    BlocBuilder<OtbCubit, DataState>(
                      builder: (context, state) {
                        if (state == DataState.loading) {
                          return CircularProgressIndicator();
                        } else {
                          return AppButton(
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.sentData();
                              } else {
                                showMessage(
                                  'رمز التحقق غير صحيح .يرجى المحاولة مرة أخرى.',
                                  isError: true,
                                );
                              }
                            },
                            text: 'تحقق',
                            width: 343.w,
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    BlocBuilder< OtbCubit,DataState>(builder: (context, state) {
                  final    cubit= context.read<OtbCubit>();
               //todo
                if (cubit.showResend) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.replay),
                            SizedBox(width: 8.w),
                            Text(
                              'إعادة إرسال الرمز',
                              style: TextStyle(
                                color: Color(0xff251800),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        textAlign: TextAlign.center,
                        'إعادة الإرسال مرة أخرى؟\nطلب رمز جديد في 00:30 ثانية',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  );
                }
                      else {
                  return Text('');
                }
                    },)

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
