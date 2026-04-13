import 'package:company_apg_2026/core/logic/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_search.dart';
import '../../core/them_project/cubit_theme.dart';

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
              CubitTheme.get(context).selectTheme(ThemeModeState.light);
              CashHelper.getThemeMode(CashHelperKeys.themeMode);
            },
            icon: Icon(Icons.light_mode),
          ),
          IconButton(
            onPressed: () {
              CubitTheme.get(context).selectTheme(ThemeModeState.dark);
              CashHelper.getThemeMode(CashHelperKeys.themeMode);

            },
            icon: Icon(Icons.dark_mode),
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
              height: 60.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: models.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedIndex;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            models[index].name,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                  ;
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
