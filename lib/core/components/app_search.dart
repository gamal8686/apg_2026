import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,

      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              'ابحث بالاسم أو الوظيفة',
              style: TextStyle(
                color: Color(0xff9CA3AF),
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Cairo',
              ),
            ),
            Spacer(),
            Icon(Icons.search, size: 40),
          ],
        ),
      ),
    );
  }
}
