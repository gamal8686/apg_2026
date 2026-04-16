import 'dart:ffi';

import 'package:company_apg_2026/core/components/app_back.dart';
import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/components/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_admin.dart';

class ItemsManagementView extends StatefulWidget {
  const ItemsManagementView({super.key});

  @override
  State<ItemsManagementView> createState() => _ItemsManagementViewState();
}

class _ItemsManagementViewState extends State<ItemsManagementView> {
  List<int> counters = List.generate(5, (index) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppAdmin(onTap: () {}),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'اداره الاصناف',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: AppBack(pass: 'arrow-left.svg'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
            AppSearch(onPressed: () {},labelText: 'الصنف بالرقم',),
            SizedBox(height: 10.h),
            Text(
              'اجمالي الاصناف * : 540 ',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 180.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.8,
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 5.h),

                              AppImage(
                                path: 'bottel_product.png',
                                height: 80.h,
                                width: 80.w,
                              ),
                              SizedBox(width: 10.h),
                              Text(
                                'زجاج 250 مللي',
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 50.h),
                              Text(
                                '500\nقطعة',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 2.h,
                            color: Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.50),
                            indent: 10,
                            endIndent: 10,
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'تعديل سريع للكميه :',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                Container(
                                  height: 50.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.8,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      spacing: 12,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                counters[index]++;
                                              });
                                            },
                                            child: Container(
                                              height: 40.h,
                                              width: 40.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Icon(Icons.add),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${counters[index]}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                counters[index]--;
                                                if (counters[index] < 0) {
                                                  counters[index] = 0;
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: 40.h,
                                              width: 40.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Icon(Icons.remove),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
            ),
            Row(
              spacing: 5.w,
              children: [
                Expanded(
                  child: AppButton(text: 'حفظ الكميه', onPressed: () {}),
                ),

                Expanded(
                  child: AppButton(text: 'اضافة منتج', onPressed: () {}),
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
