import 'package:company_apg_2026/core/logic/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_search.dart';
import '../../core/cubit/them_project/cubit_theme.dart';

class EmployerView extends StatefulWidget {
  const EmployerView({super.key});

  @override
  State<EmployerView> createState() => _EmployerViewState();
}

class _EmployerViewState extends State<EmployerView> {
  final List<Model> models = [
    Model('الكل'),
    Model('عمال'),
    Model('سائقين'),
    Model('مشرفين'),
    Model('إداريين'),
    Model('ميكانيكي'),
  ];
  int isSelected = 0;
  int selectedIndex = 0;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,

        title: Text(
          'العاملين',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Cairo',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
              CubitTheme.get(context).selectTheme(
                isDarkMode ? ThemeModeState.light : ThemeModeState.dark,
              );
              CashHelper.getThemeMode(CashHelperKeys.themeMode);
            },
            icon: isDarkMode ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(15),
        child: Column(
          children: [
            AppSearch(),
            SizedBox(height: 20.h),

            SizedBox(
              height: 50.h,
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
                        duration: Duration(milliseconds: 300),
                        scale: isSelected ? 1.1 : .9,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: 45.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: Theme.of(
                                        context,
                                      ).primaryColor.withValues(alpha: 0.4),
                                      blurRadius: 15,
                                      offset: Offset(0, 4),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 300),
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                                fontSize: isSelected ? 20.sp : 17.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Cairo',
                              ),
                              child: Text(models[index].name),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //todo:please complete this page
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
