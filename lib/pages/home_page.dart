import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

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
            icon: AppImage(path: 'category.png', height: 20),
            label: 'التعليمات',
          ),
          BottomNavigationBarItem(
            icon: AppImage(path: 'prodect.png', height: 20),
            label: 'الانتاج',
          ),
          BottomNavigationBarItem(
            icon: AppImage(path: 'car.png', height: 20),
            label: 'الانتاج',
          ),
          BottomNavigationBarItem(
            icon: AppImage(path: 'parson.png', height: 20),
            label: 'الانتاج',
          ),
          BottomNavigationBarItem(
            icon: AppImage(path: 'orders.png', height: 20),
            label: 'الانتاج',
          ),
        ],
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
