import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputValidator {
  static final RegExp validatePhoneNumberWithoutCode = RegExp(
    r'^[1-9][0-9]{9}$',
  );
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  // RegExp if need regex if not need not problem
  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة  يجب أن تكون اكثر من 10 حرفًا';
    } else if (value.length > 20) {
      return 'كلمة  يجب أن تكون أقل من 15 حرفًا';
    }
    return null;
  }
}
