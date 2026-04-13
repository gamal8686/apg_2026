import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';

class AppBack extends StatelessWidget {
  final String pass;
  final double? radius;
  final Function()? onTap;

  const AppBack({super.key, required this.pass, this.radius, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.15),
          radius: radius,

          child: AppImage(path: pass, height: 20.h),
        ),
      ),
    );
  }
}
