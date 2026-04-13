import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final double? width;
  final void Function() onPressed;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator(strokeAlign: 0.9,),);
    }
    return SizedBox(
      width: width,
      child: FilledButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 23.sp, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
