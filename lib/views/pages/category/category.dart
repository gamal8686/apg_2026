import 'package:company_apg_2026/core/components/app_back.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_admin_card.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10.h),

          children: [
            Row(
              children: [
                ClipOval(
                  child: AppImage(
                    path:
                        'https://tse2.mm.bing.net/th/id/OIP.AQtvP5FcfiEMQpu14ueJCgHaGU?rs=1&pid=ImgDetMain&o=7&rm=3',
                    height: 50.h,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  children: [
                    Text(
                      'احمد عماد',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        fontFamily: 'Cairo',
                        color: Color(0xff292D32),
                      ),
                    ),
                    Text(
                      'مدير المخزون',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        fontFamily: 'Cairo',
                        color: Color(0xff292D32),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                AppBack(pass: 'boll.png'),
              ],
            ),
            SizedBox(height: 30.h),
            Text(
              'مرحبا بك في لوحه التحكم',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                fontFamily: 'Cairo',
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'اداره الانتاج والمخزون بكفاءه',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                fontFamily: 'Cairo',
                color: Color(0xff7F8B8B),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      goTo(HomePage(initialIndex: 1,));
                    },
                    child: AppAdminCard(
                      title: 'الانتاج التام',
                      subtitle: 'عرض كل الزجاجات والعبوات\nواماكنها',
                      path: 'box_admin.png',
                      count: '1,200',
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      goTo(HomePage(initialIndex: 3,));
                    },
                    child: AppAdminCard(
                      title: 'العاملين',
                      subtitle: 'تحديث كميات اليوم\n لكل صنف',
                      path: 'under_ review.png',
                      count: 'تحديث الان',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      goTo(HomePage(initialIndex: 2,));
                    },
                    child: AppAdminCard(
                      title: 'سيارات التحميل',
                      subtitle: 'مواعيد الشحنات \nالقادمه وتفاصيلها',
                      path: 'car_car.png',
                      count: '8 شحنات اليوم',
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      goTo(HomePage(initialIndex: 4,));
                    },
                    child: AppAdminCard(
                      title: 'التعليمات',
                      subtitle: 'اطلع علي تعليماتك\n او تعليمات المدير',
                      path: 'sheet.png',
                      count: '3 تعليمات جديده',
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
