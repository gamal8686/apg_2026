import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../logic/helper_methods.dart';

class AppLoginOrRegister extends StatelessWidget {
  final bool isLogin;
  final void Function()? onPressed;

  const AppLoginOrRegister({super.key, this.isLogin = true, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: isLogin ? "ليس لديك حساب؟" : "هل لديك حساب بالفعل؟",
              style: TextStyle(
                color: Color(0xff9D9D9D),
                fontWeight: FontWeight.w300,
                fontSize: 16.sp,
              ),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                ),
                child: Text(
                  isLogin ? "سجل الآن" : " تسجيل الدخول",
                  style: TextStyle(
                    color: Color(0xff5A3A22),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                onPressed:onPressed ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
