import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return    Divider(
      thickness: 1,
      indent: 10,
      endIndent: 10,
      height: 10.h,
      color: Colors.black54,
    );
  }
}
