import 'package:auto_size_text/auto_size_text.dart';
import 'package:company_apg_2026/core/logic/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_light_dark.dart';
import '../../../core/components/app_search.dart';
import '../../../core/cubit/them_project/cubit_theme.dart';

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
        actions: [
          AppLightDark()
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            AppSearch(),
            SizedBox(height: 20.h),


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
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
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


            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: subData[models[selectedIndex].name]?.length ?? 0,
                itemBuilder: (context, index) {
                  final item =
                      subData[models[selectedIndex].name]?[index] ?? '';

                  return Container(
                    height: 80.h,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        item,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  );
                },
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
