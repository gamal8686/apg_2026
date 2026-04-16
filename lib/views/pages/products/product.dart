import 'package:company_apg_2026/core/components/app_back.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/components/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:company_apg_2026/core/components/app_admin.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppAdmin(onTap: () {}),
      appBar: AppBar(
        title: Text(
          'اداره الانتاج',
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
            SizedBox(height: 20.h),
            AppSearch(
              onPressed: () {},
              labelText: 'ابحث عن منتج او زجاج او عبوه',
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: GridView.builder(
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffFFDECC)),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),

                      Row(

                        children: [
                        AppImage(
                          path: 'bottel_product.png',
                          height: 70.h,
                          width: 70.w,
                        ),
                       SizedBox(width: 35.w,),
                        AppBack(pass: 'Remove.png')
                        
                      ],),
                        SizedBox(height: 10.h),

                        Text(
                          'عبوه 250 مللي',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10.h),

                        Text.rich(
                          TextSpan(
                            text: 'عدد البالتات ',
                            style: TextStyle(color: Colors.black),

                            children: [
                              TextSpan(
                                text: '500',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            AppImage(
                              path: 'array.png',
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(width: 5.h),
                            Text.rich(
                              TextSpan(
                                text: '4 ',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'صفوف',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AppImage(
                              path: 'home_project.png',
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(width: 5.h),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text.rich(
                                TextSpan(
                                  text: 'مخزن A',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
