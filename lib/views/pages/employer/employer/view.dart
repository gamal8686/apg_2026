import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_admin.dart';
import '../../../../core/components/app_container_par.dart';
import '../../../../core/components/app_light_dark.dart';
import '../../../../core/components/app_search.dart';
import '../employer_details/view.dart';

class EmployerView extends StatefulWidget {
  const EmployerView({super.key});

  @override
  State<EmployerView> createState() => _EmployerViewState();
}

class _EmployerViewState extends State<EmployerView> {
  final List<Model> models = [
    Model('الكل'),
    Model('المالية'),
    Model('التكاليف'),
    Model('شئون العاملين'),
    Model('المبيعات'),
    Model('المشتريات'),
    Model('الجراج والحركة'),
    Model('المنتج النهائى'),
    Model('الفحص'),
    Model('i.s'),
  ];
  final Map<String, List<String>> subData = {
    'الكل': ['موظف 1', 'موظف 2', 'موظف 3'],
    'المالية': ['محاسب 1', 'محاسب 2'],
    'التكاليف': ['تكلفة 1', 'تكلفة 2'],
    'شئون العاملين': ['HR 1', 'HR 2'],
    'المبيعات': ['Sales 1', 'Sales 2'],
    'المشتريات': ['Buy 1', 'Buy 2'],
    'الجراج والحركة': ['Car 1', 'Car 2'],
    'المنتج النهائى': ['Prod 1', 'Prod 2'],
    'الفحص': ['Check 1', 'Check 2'],
    'i.s': ['IS 1', 'IS 2'],
  };

  int isSelected = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppAdmin(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,

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

      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppContainerPar(),
            SizedBox(height: 10.h),
            AppSearch(),
            SizedBox(height: 10.h),

            SizedBox(
              height: 55.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: models.length,
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
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        scale: isSelected ? 1.15 : 0.95,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          width: isSelected ? 105.w : 90.w,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: Theme.of(
                                        context,
                                      ).primaryColor.withOpacity(0.3),
                                      blurRadius: 12,
                                      offset: Offset(0, 5),
                                    ),
                                  ]
                                : [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                          ),
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeInOutQuint,
                              style: TextStyle(
                                fontSize: isSelected ? 16.sp : 14.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Cairo',
                                color: isSelected
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              ),
                              child: Text(
                                models[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20.h),
            Text(
              'اجمالي الموظفين  : 9',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                fontFamily: 'Cairo',
                color: Color(0xff292D32),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  goTo(EmployerDetailsView() );
                },
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: subData[models[selectedIndex].name]?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item =
                        subData[models[selectedIndex].name]?[index] ?? '';
                
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 170.h,
                        decoration: BoxDecoration(
                          color:   Color(0xffFDF0E9),
                          border: Border.all(color: Color(0xffF4F4F4)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: AppImage(
                                  path:
                                      'https://scontent.fcai19-2.fna.fbcdn.net/v/t39.30808-6/655757355_914435494703347_4741616360734265394_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=1d70fc&_nc_ohc=XBa095afCzMQ7kNvwFaE237&_nc_oc=Adr9VDAabL6GPPTtKGKTYSiVA3ldAQsY6NcNJVKbpyMikPIgndDN0jjQ6Eiqfh6rD78&_nc_zt=23&_nc_ht=scontent.fcai19-2.fna&_nc_gid=RL_Rh33QyIvT0ksIzEaicQ&_nc_ss=7a3a8&oh=00_Af3x6g_Bqg0mzMsq2S00op4j7yL14pLcugVm-drYdEY8cA&oe=69ED2EF7',
                                  height: 70.h,
                                ),
                              ),
                              SizedBox(width: 10.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.h,),
                                  Text(
                                    'اسامة جمال جمال ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20.sp,
                                      fontFamily: 'Cairo',
                                      color: Color(0xff292D32),
                                    ),
                                  ),
                                  SizedBox(height: 5.h,),
                                  Text(
                                    'موظف ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.sp,
                                      fontFamily: 'Cairo',
                                      color: Color(0xff292D32),
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  Row(
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
                                  SizedBox(height: 10.h,),
                                  Row(
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Model {
  String name;

  Model(this.name);
}
