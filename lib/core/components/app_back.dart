import 'package:flutter/material.dart';

import 'app_image.dart';

class AppBack extends StatelessWidget {
  final String pass;
  final double? radius;
  final Function()? onTap;
final double? heightImage;
  const AppBack({super.key, required this.pass, this.radius, this.onTap, this.heightImage=20});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.15),
        radius: radius,

        child: AppImage(path: pass, height: heightImage),
      ),
    );
  }
}
