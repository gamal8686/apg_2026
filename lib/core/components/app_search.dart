import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {},
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.r)),
        labelText: 'ابحث بالرقم الوظيفة',
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.search, size: 40),
        ),
      ),
    );
  }
}
