
import 'package:company_apg_2026/views/pages/products/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../core/components/app_image.dart';
import 'car/car.dart';
import 'employer/employer.dart';
import 'category.dart';
import 'order/order.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Model> list = [
    Model(OrderPage()),
    Model(ProductPage()),
    Model(CarPage()),
    Model(EmployerView()),
    Model(CategoryPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12.sp,
        unselectedFontSize: 8.sp,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
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
          BottomNavigationBarItem(
            icon: AppImage(path: 'category.png', height: 20.h),
            label: 'التعليمات',
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
          BottomNavigationBarItem(
            icon: AppImage(path: 'orders.png', height: 25.h),
            label: 'الرئيسيه',
          ),
        ],
      ),
      body: list[currentIndex].page,
    );
  }
}

class Model {
  final Widget page;

  Model(this.page);
}
