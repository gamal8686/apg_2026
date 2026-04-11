import 'package:company_apg_2026/core/components/app_image.dart';

import 'package:company_apg_2026/views/pages/category.dart';
import 'package:company_apg_2026/views/pages/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'car.dart';
import 'employer.dart';
import 'order.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 3;
  final List<Model> list = [
    Model(CategoryPage()),
    Model(ProductPage()),
    Model(CarPage()),
    Model(EmployerView()),
    Model(OrderPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15.sp,
        unselectedFontSize: 10.sp,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,

        unselectedItemColor: Colors.black87,
        iconSize: 20,

        items: [
          BottomNavigationBarItem(
            icon: AppImage(path: 'category.png', height: 20.h),
            label: 'التعليمات',
          ),
          BottomNavigationBarItem(
            icon: AppImage(path: 'product.png', height: 20.h),
            label: 'الموظفين',
          ),
          BottomNavigationBarItem(
            icon: AppImage(path: 'car.png', height: 20.h),
            label: 'الشحن',
          ),
          BottomNavigationBarItem(
            icon: AppImage(path: 'parson.png', height: 25.h),
            label: 'الانتاج',
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
