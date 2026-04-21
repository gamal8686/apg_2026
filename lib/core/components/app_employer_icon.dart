import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';

class AppEmployerIcon extends StatelessWidget {
  final String pass;
  final String title;
  final String subTitle;
  final String subTitle2;
  const AppEmployerIcon({super.key, required this.pass, required this.title, required this.subTitle, required this.subTitle2});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 160.h,
      width: 190.w,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffF4F4F6)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage(path: pass, height: 25.h),
            SizedBox(height: 10.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w900,
                color: Color(0xff292D32),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              subTitle2,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                color: Color(0xff292D32),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
