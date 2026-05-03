import 'package:company_apg_2026/core/components/app_back.dart';
import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/app_container_par.dart';

import '../../../../core/components/app_divider.dart';
import '../../../../core/components/app_employer_icon.dart';
import '../../../../core/components/app_light_dark.dart';
import '../../../../core/logic/helper_methods.dart';
import '../../home_page.dart';

class EmployerDetailsView extends StatefulWidget {
  const EmployerDetailsView({super.key});

  @override
  State<EmployerDetailsView> createState() => _EmployerDetailsViewState();
}

class _EmployerDetailsViewState extends State<EmployerDetailsView> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _tileKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: AppBack(
          pass: 'arrow-left.svg',
          onTap: () {
            goTo(HomePage(initialIndex: 3));
          },
        ),
        title: Text(
          'العاملين',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
            fontFamily: 'Cairo',
          ),
        ),
        actions: [AppLightDark()],
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          AppContainerPar(),
          SizedBox(height: 20.h),
          Center(
            child: ClipOval(
              child: AppImage(
                path:
                    'https://scontent.fcai19-2.fna.fbcdn.net/v/t39.30808-6/655757355_914435494703347_4741616360734265394_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=1d70fc&_nc_ohc=XBa095afCzMQ7kNvwFaE237&_nc_oc=Adr9VDAabL6GPPTtKGKTYSiVA3ldAQsY6NcNJVKbpyMikPIgndDN0jjQ6Eiqfh6rD78&_nc_zt=23&_nc_ht=scontent.fcai19-2.fna&_nc_gid=RL_Rh33QyIvT0ksIzEaicQ&_nc_ss=7a3a8&oh=00_Af3x6g_Bqg0mzMsq2S00op4j7yL14pLcugVm-drYdEY8cA&oe=69ED2EF7',
                height: 100.h,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImage(path: 'email.png', height: 20.h),
              SizedBox(width: 10.w),
              Text(
                'swemad2004@gmail.com ',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  fontFamily: 'Cairo',
                  color: Color(0xff292D32),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImage(path: 'phone.png', height: 20.h),
              SizedBox(width: 10.w),
              Text(
                '01065953330',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  fontFamily: 'Cairo',
                  color: Color(0xff292D32),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          AppDivider(),
          SizedBox(height: 5.h),
          Row(
            children: [
              Expanded(
                child: AppEmployerIcon(
                  pass: 'data_employer.png',
                  title: 'الاجازات',
                  subTitle: '12 يوم',
                  subTitle2: 'المتبقى 21',
                ),
              ),
              Expanded(
                child: AppEmployerIcon(
                  pass: 'x_employer.png',
                  title: 'الغيابات',
                  subTitle: '3 أيام',
                  subTitle2: ' هذا الشهر',
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Expanded(
                child: AppEmployerIcon(
                  pass: 'wallet_employer.png',
                  title: 'الراتب',
                  subTitle: ' 8500 جنيه',
                  subTitle2: ' الصافي',
                ),
              ),
              Expanded(
                child: AppEmployerIcon(
                  pass: 'boll_employer.png',
                  title: 'التعليمات',
                  subTitle: '5 تعليمات',
                  subTitle2: ' نشطه ',
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          ExpansionTileCard(
            key: _tileKey,
            onExpansionChanged: (isExpanded) {
              if (isExpanded) {
                Future.delayed(Duration(milliseconds: 300), () {
                  Scrollable.ensureVisible(
                    _tileKey.currentContext!,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              }
            },
            baseColor: Colors.grey[200],

            expandedColor: Colors.white,
            title: Text(
              'سجل الاجازات',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اجازه سنويه',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        fontFamily: 'Cairo',
                        color: Color(0xff292D32),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 5.h),
                        AppImage(path: 'data_time.png', height: 20.h),
                        SizedBox(width: 10.w),
                        Text(
                          '10-05-2024 - 15-05-2024',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            fontFamily: 'Cairo',
                            color: Color(0xff292D32),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppImage(path: 'i_image.png', height: 20.h),
                        SizedBox(width: 10.w),
                        Text(
                          '5 ايام ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            fontFamily: 'Cairo',
                            color: Color(0xff292D32),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          ExpansionTileCard(
            onExpansionChanged: (isExpanded) {
              if (isExpanded) {
                Future.delayed(Duration(milliseconds: 300), () {
                  Scrollable.ensureVisible(
                    _tileKey.currentContext!,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              }
            },
            baseColor: Colors.grey[200],

            expandedColor: Colors.white,
            title: Text(
              'سجل الغيابات',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),
                    Text(
                      'غياب بعذر',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        fontFamily: 'Cairo',
                        color: Color(0xff292D32),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppImage(path: 'data_time.png', height: 20.h),
                        SizedBox(width: 10.w),
                        Text(
                          '10-05-2024 - 15-05-2024',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            fontFamily: 'Cairo',
                            color: Color(0xff292D32),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppImage(path: 'i_image.png', height: 20.h),
                        SizedBox(width: 10.w),
                        Text(
                          'عذر طبي',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            fontFamily: 'Cairo',
                            color: Color(0xff292D32),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          ExpansionTileCard(
            onExpansionChanged: (isExpanded) {
              if (isExpanded) {
                Future.delayed(Duration(milliseconds: 300), () {
                  Scrollable.ensureVisible(
                    _tileKey.currentContext!,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              }
            },
            baseColor: Colors.grey[200],

            expandedColor: Colors.white,
            title: Text(
              'تفاصيل الراتب',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          'الراتب الاساسي : ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            fontFamily: 'Cairo',
                            color: Color(0xff292D32),
                          ),
                        ),
                        Text(
                          '8500 جنيه',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            fontFamily: 'Cairo',
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '+ 500 جنيه بدل انتقال',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        fontFamily: 'Cairo',
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      '+ 500 جنيه حافز اداء',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        fontFamily: 'Cairo',
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '-800 جنيه تامينات',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        fontFamily: 'Cairo',
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '-300 جنيه ضرائب',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        fontFamily: 'Cairo',
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      '-200 جنيه خصم غيابات',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        fontFamily: 'Cairo',
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          ExpansionTileCard(
            onExpansionChanged: (isExpanded) {
              if (isExpanded) {
                Future.delayed(Duration(milliseconds: 300), () {
                  Scrollable.ensureVisible(
                    _tileKey.currentContext!,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              }
            },
            baseColor: Colors.grey[200],

            expandedColor: Colors.white,
            title: Text(
              'التعليمات النشطه',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Color(0xffC6B0A3)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),

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

                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          AppButton(text: 'تعديل بيانات الموظف', onPressed: () {},width: 122.w,),
          SizedBox(height: 5.h),
          AppButton(text: 'حذف الموظف', onPressed: () {},width: 122.w,color: Color(0xffC92A2A),),
        ],
      ),
    );
  }
}
