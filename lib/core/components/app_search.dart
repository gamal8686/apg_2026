import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearch extends StatelessWidget {
  final Function()?onPressed;
  const AppSearch({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextField(

      onTap: () {},
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(25.r)),
        labelText: 'ابحث بالرقم ',
        suffixIcon: IconButton(
          icon: Icon(Icons.search, size: 30),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
