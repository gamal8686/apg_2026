import 'package:company_apg_2026/core/components/app_back.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
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
                        'https://scontent.fcai19-2.fna.fbcdn.net/v/t39.30808-6/655757355_914435494703347_4741616360734265394_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=1d70fc&_nc_ohc=XBa095afCzMQ7kNvwFaE237&_nc_oc=Adr9VDAabL6GPPTtKGKTYSiVA3ldAQsY6NcNJVKbpyMikPIgndDN0jjQ6Eiqfh6rD78&_nc_zt=23&_nc_ht=scontent.fcai19-2.fna&_nc_gid=RL_Rh33QyIvT0ksIzEaicQ&_nc_ss=7a3a8&oh=00_Af3x6g_Bqg0mzMsq2S00op4j7yL14pLcugVm-drYdEY8cA&oe=69ED2EF7',
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
                  child: AppAdminCard(
                    title: 'الانتاج التام',
                    subtitle: 'عرض كل الزجاجات والعبوات\nواماكنها',
                    path: 'box_admin.png',
                    count: '1,200',
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: AppAdminCard(
                    title: 'الانتاج اليومي',
                    subtitle: 'تحديث كميات اليوم\n لكل صنف',
                    path: '50pont.png',
                    count: 'تحديث الان',
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: AppAdminCard(
                    title: 'سيارات التحميل',
                    subtitle: 'مواعيد الشحنات \nالقادمه وتفاصيلها',
                    path: 'car_car.png',
                    count: '8 شحنات اليوم',
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: AppAdminCard(
                    title: 'التعليمات',
                    subtitle: 'اطلع علي تعليماتك\n او تعليمات المدير',
                    path: 'sheet.png',
                    count: '3 تعليمات جديده',
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Container(
              height: 128.h,
              decoration: BoxDecoration(
                color: Color(0xffFDF0E9),
                border: Border.all(color: Color(0xffFFEAD9)),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  AppBack(pass: 'people.png', radius: 45.r, heightImage: 40.r),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'الموظفين',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          fontFamily: 'Cairo',
                          color: Color(0xff292D32),
                        ),
                      ),
                      SizedBox(height: 5.h),

                      Text(
                        'تفاصيل الموظفين وصلاحيتهم',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          fontFamily: 'Cairo',
                          color: Color(0xff7F8B8B),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '12 موظف نشط الان',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: 'Cairo',
                          color: Color(0xffE76300),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
