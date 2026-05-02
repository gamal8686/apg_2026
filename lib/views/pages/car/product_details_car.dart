import 'package:company_apg_2026/core/components/app_container_par.dart';
import 'package:company_apg_2026/core/components/app_divider.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_back.dart';
import '../../../core/components/app_image.dart';
import '../../../core/components/app_light_dark.dart';

class ProductDetailsCar extends StatelessWidget {
  const ProductDetailsCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [AppLightDark()],
        leading: AppBack(
          pass: 'arrow-left.svg',
          onTap: () {
            goTo(HomePage(initialIndex: 2,));
          },
        ),
        title: Text(
          'تفاصيل الشحنه',
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                 AppContainerPar(),

                  SizedBox(height: 10.h),

                  AppImage(path: 'logo_product.jpg'),

                  SizedBox(height: 20.h),

                  Text(
                    'شركه ابيكو',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Cairo',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 85.h,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.40),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 25.h),
                              AppImage(path: 'car_car.png', height: 20.h),
                              SizedBox(width: 15.h),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'رقم العربيه',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    'عربيه #001',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5.h),
                      Expanded(
                        child: Container(
                          height: 85.h,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.40),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 25.h),
                              AppImage(path: 'millimeter.png', height: 20.h),
                              SizedBox(width: 15.h),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'عدد البالات',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    '24 باليت',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 85.h,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.40),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 25.h),
                              AppImage(path: 'millimeter.png', height: 20.h),
                              SizedBox(width: 15.h),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'الحجم',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    '135 مللي',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5.h),
                      Expanded(
                        child: Container(
                          height: 85.h,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.40),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 25.h),
                              AppImage(path: 'data_time.png', height: 20.h),
                              SizedBox(width: 15.h),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'التاريخ',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    '13 ابريل',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),

                 AppDivider(),
                  SizedBox(height: 10.h),
                  Text(
                    'معلومات التوصيل',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Cairo',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  SizedBox(height: 5.h),

                  Container(
                    height: 95.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffFFF8E1),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5.w),
                        AppImage(path: 'Location.png', height: 30.h),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'القاهره - مدينه نصر',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'Cairo',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'شارع عباس العقاد - امام سيتي ستارز - بجوار محطه المترو',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'Cairo',
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 5.h),

                  Container(
                    height: 95.h,
                    decoration: BoxDecoration(
                      color: Color(0xffFFF8E1),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5.w),
                        AppImage(path: 'time.png', height: 30.h),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '8:00 ص - 10:00 ص',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'Cairo',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'شارع عباس العقاد - امام سيتي ستارز - بجوار محطه المترو',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'Cairo',
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  AppDivider(),
                  SizedBox(height: 5.h),
                  Text(
                    'محتويات الشحنه',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Cairo',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 95.h,
                          decoration: BoxDecoration(
                            color: Color(0xffFFF8E1),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 5.w),
                              AppImage(path: 'bottle.png', height: 30.h),
                              SizedBox(width: 15.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'باراسيتامول 500 جم',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontFamily: 'Cairo',
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      '8 بالات - 2000 علبه ',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontFamily: 'Cairo',
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  //todo
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
