import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearch extends StatelessWidget {
  final String? labelText;
  final Function()?onPressed;
  const AppSearch({super.key, this.onPressed, this.labelText});

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
          borderRadius: BorderRadius.circular(8.r),
        ),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(25.r)),
        labelText: labelText,
        suffixIcon: IconButton(
          icon: Icon(Icons.search, size: 30),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
