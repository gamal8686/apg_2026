import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_back.dart';

class AppAdminCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String path;
  final String count;
  const AppAdminCard({super.key, required this.title, required this.subtitle, required this.path, required this.count});

  @override
  State<AppAdminCard> createState() => _AppAdminCardState();
}

class _AppAdminCardState extends State<AppAdminCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 190.w,
      decoration: BoxDecoration(
        color: Color(0xffFDF0E9),
        border: Border.all(color: Color(0xffDEDDDD)),
        borderRadius: BorderRadius.circular(16.r),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          AppBack(
            pass: widget.path,
            radius: 40,
            heightImage: 50,
          ),
          SizedBox(height: 10.h),
          Text(
          widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
              fontFamily: 'Cairo',
              color: Color(0xff7F8B8B),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            widget.subtitle,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              fontFamily: 'Cairo',
              color: Color(0xff7F8B8B),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
           widget.count,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 22.sp,
              fontFamily: 'Cairo',
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    ) ;
  }
}
