import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/components/app_validator.dart';
import '../core/components/app_image.dart';
import '../core/logic/helper_methods.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  bool showResend = false;

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
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(15.w),
        child: Form(
          key: formKey,
          child: Column(
            children: [
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
                controller: otpController,
              ),
              SizedBox(height: 32.h),

              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                  } else {
                    setState(() {
                      showResend = true;
                    });
                    showMessage(
                      'رمز التحقق غير صحيح .يرجى المحاولة مرة أخرى.',
                      isError: true,
                    );
                  }
                },
                text: 'تحقق',
                width: 343.w,
              ),
              SizedBox(height: 20.h),
              if (showResend)
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Resend OTP');
                      },
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
