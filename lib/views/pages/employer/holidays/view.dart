import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_back.dart';
import '../../../../core/components/app_container_par.dart';
import '../../../../core/components/app_light_dark.dart';
import '../employer_details/view.dart';
import 'add.dart';


class HolidayDetailsView extends StatefulWidget {
  const HolidayDetailsView({super.key});

  @override
  State<HolidayDetailsView> createState() => _HolidayDetailsViewState();
}

class _HolidayDetailsViewState extends State<HolidayDetailsView> {
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBack(pass: 'plus.svg',onTap: () {
              goTo(AddHolidayView());
            },),
          ),
          SizedBox(width: 10.w,),
          AppLightDark(),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBack(
            pass: 'arrow-left.svg',
            onTap: () {
              goTo(EmployerDetailsView());
            },
          ),

          //:null,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'الاجازات',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff1E1E1E),
            fontFamily: 'Cairo',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppContainerPar(),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFDF0E9),
                        border: Border.all(color: Color(0xffEFEFEF)),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      height: 120.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppImage(path: 'holiday.png', height: 40.h),
                          SizedBox(height: 5.h),
                          Text(
                            '2',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Cairo',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'الاجمالي ',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Cairo',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w900,
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
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      height: 120.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppImage(path: 'under_ review.png', height: 40.h),
                          SizedBox(height: 5.h),
                          Text(
                            '1',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Cairo',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'قيد مراجعه',
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
              SizedBox(height: 10.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).primaryColor.withValues(alpha: .5),
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 84.w,
                                  decoration: BoxDecoration(
                                    color: false
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).primaryColor
                                              .withValues(alpha: 0.50),
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'في انتظار HR',

                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Cairo',
                                        color: false
                                            ? Colors.white
                                            : Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 60.w),
                                AppImage(path: 'data_time.png', height: 25.h),
                                SizedBox(width: 8.w),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '20 ابريل ',

                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),

                                      TextSpan(
                                        text: '-  ',

                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '25 ابريل ',

                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              children: [
                                AppImage(path: 'sick.png', height: 30.h),
                                SizedBox(width: 10.w),
                                Text(
                                  'مرضيه',

                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              children: [
                                AppImage(
                                  path: 'data_holiday.png',
                                  height: 30.h,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  '2 ايام',

                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              children: [
                                AppImage(path: 'siren.png', height: 30.h),
                                SizedBox(width: 10.w),
                                Text(
                                  'ظروف عائليه طارئه',

                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _step(context, 'employee.png', "موظف", true),

                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: true
                                        ? Theme.of(context).primaryColor
                                        : const Color(0xffE5E7EB),
                                  ),
                                ),
                                _step(context, 'manager.png', "المدير", true),
                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: false
                                        ? Theme.of(context).primaryColor
                                        : const Color(0xffE5E7EB),
                                  ),
                                ),
                                _step(context, 'hr_icon.png', "HR ", false),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    text: ' المدير',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Expanded(
                                  child: AppButton(
                                    text: ' HR',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _step(BuildContext context, String image, String label, bool active) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: active
              ? Theme.of(context).primaryColor
              : const Color(0xffE5E7EB),
          child: AppImage(path: image, height: 20.h),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    ),
  );
}
