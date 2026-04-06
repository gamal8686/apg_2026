import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'app_validator.dart';

class AppOtp extends StatelessWidget {
final  TextEditingController? controller;
final String? Function(String?)? validator;
  const AppOtp({super.key, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
validator: validator  ,

      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,

      appContext: context,
      cursorColor: Theme.of(context).primaryColor,

      length: 6,
      backgroundColor: Theme.of(
        context,
      )
          .primaryColor
          .withValues(alpha: 0.040),
      pinTheme: PinTheme(
        inactiveFillColor: Theme.of(context).primaryColor,

        selectedColor: Color(0xffD75D72),
        activeColor: Color(0xffFF2D55),
        inactiveColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8.r),

        fieldWidth: 44.w,
        fieldHeight: 44.h,
        shape: PinCodeFieldShape.box,
      ),
    );
  }
}
