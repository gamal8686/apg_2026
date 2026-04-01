import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_country_code.dart';
import 'app_image.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String)? onSelectedCountryCode;
  final String? Function(String?)? validator;
  final String? path, label;
  final Widget? prefixIcon;

  final bool dropDown;
  final bool isPassword;
  final bool isKeyboardType;
  final double isBorder;
  final bool? isLottieControlled;

  const AppInput({
    super.key,
    this.path,
    this.prefixIcon,
    this.dropDown = false,
    this.label,
    this.isPassword = false,
    this.isKeyboardType = false,
    this.isBorder = 8,
    this.controller,

    this.validator,
    this.isLottieControlled,
    this.onSelectedCountryCode,
  });

  @override
  State<AppInput> createState() => _AppInpotState();
}

class _AppInpotState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.dropDown)
              Expanded(
                flex: 1,
                child: AppCountryCode(
                  onSelectedCountryCode: (value) {
                    if (widget.onSelectedCountryCode != null) {
                      widget.onSelectedCountryCode!(value);
                    }
                  },
                ),
              ),

            Expanded(
              flex: 2,
              child: TextFormField(

                style: TextStyle(
                  fontSize: 14.sp,

                  fontFamily: 'Cairo',
                  color: Color(0xff5A3A22),
                ),
                validator: widget.validator,
                controller: widget.controller,
                keyboardType: widget.isKeyboardType
                    ? TextInputType.number
                    : TextInputType.name,
                obscureText: widget.isPassword && isHidden,
                decoration: InputDecoration(
                  prefixIcon: widget.prefixIcon,

                  suffixIcon: widget.isPassword
                      ? IconButton(
                          onPressed: () {
                            isHidden = !isHidden;
                            setState(() {});
                          },
                          icon: AppImage(
                            path: isHidden
                                ? 'visibility_off.svg'
                                : 'visibility_on.svg',
                          ),
                        )
                      : null,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),

                  labelText: widget.label,
                  labelStyle: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black87
                  ),
                  filled: true,
                  fillColor: Color(0xffD9D9D9),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.isBorder),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
