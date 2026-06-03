import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/logic/admin.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/views/pages/employer/add/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_admin.dart';
import '../../../../core/components/app_container_par.dart';
import '../../../../core/components/app_light_dark.dart';
import '../../../../core/components/app_search.dart';
import '../add/view.dart';
import '../employer_details/view.dart';
import 'cubit.dart';
//todo
class EmployerView extends StatefulWidget {
  const EmployerView({super.key});

  @override
  State<EmployerView> createState() => _EmployerViewState();
}

class _EmployerViewState extends State<EmployerView> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployerCubit(),
      child: Builder(
        builder: (context) {
          final cubit = BlocProvider.of<EmployerCubit>(context);
          return Scaffold(
            floatingActionButton:
            //todo
           // Admin.isAdmin?
            AppAdmin(onTap: () {
              goTo(AddEmployerView());
            },),

                //:null,
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
                      itemCount:cubit.  employees.length,
                      itemBuilder: (context, index) {
                        bool isSelected = index == cubit. selectedIndex;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                cubit.  selectedIndex = index;
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
                                      cubit.  employees[index].name,
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
                        goTo(EmployerDetailsView(pass:'https://thumbs.dreamstime.com/z/beautiful-autumn-beautiful-brunette-18465358.jpg' ,) );
                      },
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: cubit. subData[cubit. employees[cubit. selectedIndex].name]?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item =
                              cubit. subData[cubit. employees[cubit. selectedIndex].name]?[index] ?? '';

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
                                    Expanded(
                                      child: ClipOval(
                                        child: AppImage(
                                          path:
                                              'https://thumbs.dreamstime.com/z/beautiful-autumn-beautiful-brunette-18465358.jpg',
                                          height: 70.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10.h,),
                                        Text(
                                          'جمال اسامة جمال',
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
      ),
    );
  }
}


