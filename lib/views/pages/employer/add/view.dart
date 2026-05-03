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

class AddEmployerView extends StatefulWidget {
  const AddEmployerView({super.key});

  @override
  State<AddEmployerView> createState() => _AddEmployerViewState();
}

class _AddEmployerViewState extends State<AddEmployerView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final numberController = TextEditingController();
  final GlobalKey<ExpansionTileCardState> _tileKey = GlobalKey();
  final fromKey = GlobalKey<FormState>();
  List<String> departments = ["HR", "IT", "Sales", "Marketing", "Accounting"];
  String? selectedDepartment;
  final picker = ImagePicker();
  File? imageFile;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    numberController.dispose();

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
          'اضافه موظف جديد',
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
              Center(
                child: GestureDetector(
                  onTap: () async {
                    XFile? resp = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (resp != null) {
                      setState(() {
                        imageFile = File(resp.path);
                      });
                    }
                  },
                  child: imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            imageFile!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        )
                      : AppImage(
                          path: 'edite_image.png',
                          height: 200.h,
                          width: 200.w,
                        ),
                ),
              ),
              Text(
                'الرقم الوظيفي ',
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
                label: 'ادخل الرقم الوظيفي',
                validator: InputValidator.passwordValidator,
              ),
              SizedBox(height: 5.h),
              Text(
                'الاسم الكامل  ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              AppInput(
                label: 'ادخل الاسم الكامل',
                controller: nameController,
                validator: InputValidator.phoneValidator,
              ),
              SizedBox(height: 5.h),

              Text(
                'البريد الإلكتروني  ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              AppInput(
                label: 'ادخل البريد الإلكتروني',
                controller: emailController,
                validator: InputValidator.phoneValidator,
              ),
              SizedBox(height: 5.h),
              Text(
                'رقم الهاتف ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              AppInput(
                label: '01xxxxxxxxx',
                controller: phoneController,
                validator: InputValidator.phoneValidator,
                isKeyboardType: true,
              ),
              SizedBox(height: 5.h),
              Text(
                'العنوان',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              AppInput(
                label: 'ادخل العنوان',
                controller: addressController,
                validator: InputValidator.phoneValidator,
              ),
              SizedBox(height: 5.h),
              Text(
                'القسم',
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
                    selectedDepartment ?? 'اختار القسم',
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
              SizedBox(height: 20.h),
              AppButton(width: 390.w, text: 'حفظ', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
