import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/components/app_validator.dart';
import '../core/components/app_image.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();

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
                validator: (p0) => InputValidator.phoneValidator(p0),
                controller: otpController,),
              SizedBox(height: 32.h),
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {

                  }
                }, text: 'تحقق', width: 343.w,
              ),
              SizedBox(height: 20.h),
              Text(
                  textAlign: TextAlign.center,
                  'إعادة الإرسال مرة أخرى؟\nطلب رمز جديد في 00:30 ثانية'),


            ],
          ),
        ),
      ),


    );
  }
}
