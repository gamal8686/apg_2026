import 'dart:io';

import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/components/app_back.dart';
import '../../../../core/components/app_container_par.dart';
import '../../../../core/components/app_image.dart';
import '../../../../core/components/app_input.dart';
import '../../../../core/components/app_validator.dart';

class AddCarView extends StatefulWidget {
  const AddCarView({super.key});

  @override
  State<AddCarView> createState() => _AddCarViewState();
}

class _AddCarViewState extends State<AddCarView> {
  final nameController = TextEditingController();
  final numberPackagesController = TextEditingController();
  final dateRegistrationController = TextEditingController();
  final packageDescriptionController = TextEditingController();
  final numberController = TextEditingController();
  final GlobalKey<ExpansionTileCardState> _tileKey = GlobalKey();
  final fromKey = GlobalKey<FormState>();
  List<String> departments = [
    "ايبكو",
    "المهن",
    "الشركة العربية",
    "ادكوا",
    "Accounting",
  ];
  String? selectedDepartment;


  @override
  void dispose() {
    nameController.dispose();
    numberPackagesController.dispose();
    dateRegistrationController.dispose();
    numberController.dispose();
    packageDescriptionController.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppBack(pass: 'arrow-left.svg'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'اضافه شحنه جديده',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff1E1E1E),
            fontFamily: 'Cairo',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(15.w),
        child: Form(
          key: fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppContainerPar(),
              SizedBox(height: 10.h),

              Text(
                'رقم الشحنه ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              AppInput(
                isKeyboardType: true,
                controller: numberController,
                label: 'ادخل الرقم الشحنه',
                validator: InputValidator.passwordValidator,
              ),
              SizedBox(height: 5.h),
              Text(
                'اسم الشركه   ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: ExpansionTileCard(
                  key: _tileKey,

                  elevation: 0,
                  baseColor: Colors.transparent,
                  expandedColor: Colors.white,
                  shadowColor: Colors.transparent,

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

                  title: Text(
                    selectedDepartment ?? 'اختار الشركه',
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedDepartment == null
                          ? Colors.grey
                          : Colors.black,
                    ),
                  ),

                  trailing: Icon(Icons.arrow_drop_down),

                  children: [
                    Column(
                      children: departments.map((dept) {
                        return ListTile(
                          onTap: () {
                            setState(() {
                              selectedDepartment = dept;
                            });

                            _tileKey.currentState?.collapse();
                          },
                          leading: Icon(Icons.apartment),
                          title: Text(dept),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),

              Text(
                'عدد العبوات  ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              AppInput(
                label: 'ادخل عدد العبوات',
                controller: numberPackagesController,
                validator: InputValidator.phoneValidator,
              ),
              SizedBox(height: 5.h),
              Text(
                'تاريخ التسجيل  ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              AppInput(
                isData: true,
                label: 'تاريخ التسجيل ',
                controller: dateRegistrationController,
                validator: InputValidator.phoneValidator,
                isKeyboardType: true,
              ),
              SizedBox(height: 5.h),
              Text(
                'وصف الشحنه والملاحظات ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              AppInput(
                maxLines: 5,
                label: 'ادخل العنوان',
                controller: packageDescriptionController,
                validator: InputValidator.phoneValidator,
              ),
              SizedBox(height: 5.h),


              AppButton(width: 390.w, text: 'حفظ الشحنه', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
