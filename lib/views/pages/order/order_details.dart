import 'package:company_apg_2026/core/components/app_back.dart';
import 'package:company_apg_2026/core/components/app_container_par.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_light_dark.dart';
import '../../../core/logic/helper_methods.dart';
import '../home_page.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBack(
          pass: 'arrow-left.svg',
          onTap: () {
            goTo(HomePage());
          },
        ),
        actions: [AppLightDark()],
        title: Text(
          'تفاصيل التعليمات',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Cairo',
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.all(19.w),
        children: [
          AppContainerPar(),
          SizedBox(height: 10.h),
          Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            height: 10.h,
            color: Colors.black54,
          ),
          SizedBox(height: 5.h),
          Text(
            'تعليمات جديده بخصوص اضافه الموظفين',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'Cairo',
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              AppImage(path: 'time.png', width: 20.w),
              SizedBox(width: 5.w),

              Text(
                'تم النشر منذ ساعتين',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Cairo',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            height: 10.h,
            color: Colors.black54,
          ),
          SizedBox(height: 5.h),

          Text(
            'تم تحديث طريقة إدخال البيانات ويجب التأكد من رقم الهاتف والبريد الإلكتروني:\n\n'
            'يرجى اتباع الخطوات التالية:\n'
            '1- الدخول إلى نظام إدارة الموظفين\n'
            '2- اختيار قسم الموارد البشرية\n'
            '3- إضافة البيانات المطلوبة بدقة\n'
            '4- التأكد من صحة المعلومات قبل الحفظ',
            style: TextStyle(
              color: Color(0xff263238),
              fontFamily: 'Cairo',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.h),
          Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            height: 10.h,
            color: Colors.black54,
          ),
          SizedBox(height: 5.h),
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Color(0xffFFF3E0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppImage(
                    path: 'Attention.png',
                    width: 20.w,
                  ),

                  SizedBox(width: 10.w),

                  Expanded(
                    child: Text(
                      'للاستفسارات يرجى التواصل مع قسم الموارد البشرية',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Cairo',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
