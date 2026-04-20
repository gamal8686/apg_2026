import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_container_par.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/views/pages/order/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_light_dark.dart';
import '../../../core/components/app_search.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final List<Model> list = [
    Model('الكل'),
    Model('وردية (أ)'),
    Model('وردية (ب)'),
    Model('وردية (ج)'),
    Model('وردية (د)'),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [AppLightDark()],
        title: Text(
          'اداره التعليمات',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppContainerPar(),

            SizedBox(height: 10.h),
            Text(
              'التعليمات  والتحديثات',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'تابع اخر التعليمات والتنبيهات الخاصه بالعمل',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 50.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedIndex;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedScale(
                        duration: Duration(milliseconds: 300),
                        scale: isSelected ? 1.1 : .9,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: 45.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: Theme.of(
                                        context,
                                      ).primaryColor.withValues(alpha: 0.4),
                                      blurRadius: 15,
                                      offset: Offset(0, 4),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 300),
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                                fontSize: isSelected ? 20.sp : 17.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Cairo',
                              ),
                              child: Text(list[index].name),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
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
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                return    Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(

                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xffc2c7cc)),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).primaryColor,
                          blurRadius: 0,
                          spreadRadius: 1,
                          offset: Offset(5, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 40.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'عاجل',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Cairo',
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 12.r,
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'تعليمات جديده بخصوص اضافه الموظفين',

                            style: TextStyle(
                              color: Theme.of(context).primaryColor,

                              fontFamily: 'Cairo',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            '  الهاتف والبريد الالكتروني تم تحديث طريقه ادخال البيانات ويجب التاكد من رقم',

                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Cairo',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              AppImage(
                                color: Theme.of(context).primaryColor,
                                path: 'time.png',
                                height: 15.h,
                                width: 15.w,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                'منذ 5 دقائق',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              AppButton(text: 'تفاصيل', onPressed: () {
                                goTo(OrderDetails());
                              },width:203.w ,),
                              SizedBox(width: 5.w),
                              AppButton(text: 'حذف', onPressed: () {},width:106.w ,),
                            ],
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                  ),
                );
              },),
            )

          ],
        ),
      ),
    );
  }
}

class Model {
  final String name;

  Model(this.name);
}
