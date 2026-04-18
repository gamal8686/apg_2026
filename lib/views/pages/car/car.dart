import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key});

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' اداره عربيات التحميل',
          style: TextStyle(
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
            Center(
              child: Container(
                height: 5.h,
                width: 88.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff4B2713),
                      Color(0xff4B2713).withValues(alpha: 0.10),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10.h),
            Text(
              'جدول توزيع الادويه اليوم',
              style: TextStyle(
                color: Color(0xff263238),
                fontFamily: 'Cairo',
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView(
                children: [

                  SlideTransition(
                    position: _animation,
                    child: FadeTransition(
                      opacity: _controller,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffFFF3E0),
                                border: Border.all(color: Color(0xffEFEFEF)),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              height: 120.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppImage(path: 'car_car.png', height: 20.h),
                                  SizedBox(height: 5.h),
                                  Text(
                                    '5',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    'عربيات اليوم',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffFFF3E0),
                                border: Border.all(color: Color(0xffEFEFEF)),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              height: 120.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppImage(path: 'inbox.png', height: 20.h),
                                  SizedBox(height: 5.h),
                                  Text(
                                    '5',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    'عربيات اليوم',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Cairo',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  ...List.generate(2, (index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffEFEFEF)),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'شركه ابيكو',
                            style: TextStyle(
                              color: Color(0xff292D32),
                              fontFamily: 'Cairo',
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Text(
                                'يوم 5 يناير',
                                style: TextStyle(
                                  color: Color(0xff292D32),
                                  fontFamily: 'Cairo',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(2), // سمك البوردر
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black, // لون البوردر
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                               maxRadius: 15,
                                    child: Text('1',
                                  style: TextStyle(
                                    color: Color(0xff292D32),
                                    fontFamily: 'Cairo',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                  ),)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              AppImage(path: 'inbox_car.png', height: 30.h),
                              SizedBox(width: 8.w),
                              Text(
                                '24  ',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'Cairo',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'بالتة',
                                style: TextStyle(
                                  color: Color(0xff292D32),
                                  fontFamily: 'Cairo',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 80.w),
                              AppImage(path: 'millimeter.png', height: 30.h),
                              SizedBox(width: 8.w),
                              Text(
                                '135',
                                style: TextStyle(
                                  color: Color(0xff292D32),
                                  fontFamily: 'Cairo',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'مل',
                                style: TextStyle(
                                  color: Color(0xff292D32),
                                  fontFamily: 'Cairo',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              AppImage(
                                path: 'Location.png',
                                height: 30.h,
                                width: 30,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'القاهره - مدينه نصر ',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'Cairo',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              AppImage(
                                path: 'time.png',
                                height: 30.h,
                                width: 30,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '8:00 ص ',
                                style: TextStyle(
                                  color: Color(0xff292D32),
                                  fontFamily: 'Cairo',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'تعليمات خاصه :',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Cairo',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            height: 85.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(8.r),
                              color: Color(0xffFFF3E0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'التسليم لمسؤل المخزن مباشره - التاكد من التوقيع',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'Cairo',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                                maxLines: 5,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          AppButton(
                            text: 'تفاصيل',
                            onPressed: () {},
                            width: double.infinity,

                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
