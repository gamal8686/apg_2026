import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_back.dart';
import '../../../../core/components/app_container_par.dart';
import '../../../../core/components/app_image.dart';
import '../../../../core/components/app_input.dart';
import '../../../../core/components/app_validator.dart';

class AddEmployerView extends StatelessWidget{
  const AddEmployerView({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: Padding(
         padding: const EdgeInsets.all(15.0),
         child: AppBack(pass: 'arrow-left.svg'),
       ),
       centerTitle: true,
       backgroundColor: Colors.transparent,
       title: Text(
         'اضافه موظف جديد',
         style: TextStyle(
           fontSize: 20.sp,
           fontWeight: FontWeight.w600,
           color: Color(0xff1E1E1E),
           fontFamily: 'Cairo',
         ),
       ),
     ),
     body: SingleChildScrollView(
       padding: EdgeInsetsGeometry.all(15.w),
       child: Form(
         //key: formKey,
         child: Column(
           children: [
             AppContainerPar(),
             SizedBox(height: 10.h),










           ],
         ),
       ),
     ),
   );
  }



}