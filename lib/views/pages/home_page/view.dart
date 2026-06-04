
import 'package:company_apg_2026/core/logic/admin.dart';
import 'package:company_apg_2026/views/pages/home_page/cubit.dart';
import 'package:company_apg_2026/views/pages/products/product/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../core/components/app_image.dart';
import '../car/car/view.dart';
import '../employer/employer/view.dart';
import '../category/view.dart';
import '../order/order/view.dart';

class HomePage extends StatelessWidget {
  final int initialIndex;
  const HomePage({super.key,   this.initialIndex=0});






  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomepageCubit(  initialIndex: initialIndex,),
      child: Builder(
        builder: (context) {
          final cubit = context.watch<HomepageCubit>();
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 12.sp,
              unselectedFontSize: 8.sp,
              currentIndex: cubit.currentIndex,


                onTap: (index) {
                  cubit.changeIndex(index);
                },


              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).primaryColor,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withValues(alpha: 0.6),

              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Cairo',
                color: Colors.white24
              ),

              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Cairo',
                  color: Colors.black54
              ),
              iconSize: 20,

              items: [
                //todo
              //  if(Admin.isAdmin)
                BottomNavigationBarItem(
                  icon: AppImage(path: 'category.png', height: 20.h),
                  label: 'الرئيسيه',
                ),
                BottomNavigationBarItem(
                  icon: AppImage(path: 'product_home.png', height: 20.h),
                  label: 'لانتاج',
                ),
                BottomNavigationBarItem(
                  icon: AppImage(path: 'car.png', height: 20.h),
                  label: 'الشحن',
                ),
                BottomNavigationBarItem(
                  icon: AppImage(path: 'parson.png', height: 25.h),
                  label: '  االموظفين  ',
                ),
                // if(Admin.isAdmin)
                BottomNavigationBarItem(
                  icon: AppImage(path: 'orders.png', height: 25.h),
                  label: 'التعليمات',
                ),
              ],
            ),
            body: cubit.list[cubit.currentIndex].page,
          );
        }
      ),
    );
  }
}


