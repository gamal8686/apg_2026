import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/app_image.dart';

Widget step(BuildContext context, String image, String label, bool active) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: active
              ? Theme.of(context).primaryColor
              : const Color(0xffE5E7EB),
          child: AppImage(path: image, height: 20.h),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    ),
  );
}
