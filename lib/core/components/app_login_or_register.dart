import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/helper_methods.dart';

class AppLoginOrRegister extends StatelessWidget {
  final void Function()? onPressed;

  const AppLoginOrRegister({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                ),

                onPressed: onPressed,
                child: Text(
                  " Login",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,

                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ),

            TextSpan(
              text: "Back to",
              style: TextStyle(
                color: Color(0xff9D9D9D),
                fontWeight: FontWeight.w400,
                fontFamily: 'Cairo',
                fontSize: 18.sp,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
