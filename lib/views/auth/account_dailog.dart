
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/logic/helper_methods.dart';

class AccountActivatedDialog extends StatelessWidget {
  final bool isFromCreateAccount;

  const AccountActivatedDialog({super.key, this.isFromCreateAccount = false});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      children: [
        Container(
          margin: EdgeInsetsDirectional.all(15.r),
          child: Column(
            children: [
              AppImage(path: 'success.png', height: 100.h, width: 100.w),

              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Text(
                  'تم تأكيد الحساب بنجاح',

                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'سعيدون بترحيبك!',

                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12.sp, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 26.h),

              AppButton(
                onPressed: () {
                  // goTo(
                  //   isFromCreateAccount ? HomeView() : LoginView(),
                  //   canPop: false,
                  // );
                },
                text: 'هيا نبدأ'  ,
                width: 270.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
