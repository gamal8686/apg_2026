import 'dart:io';

import 'package:company_apg_2026/views/pages/employer/edite/state.dart';
import 'package:company_apg_2026/views/pages/home_page/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/components/app_back.dart';
import '../../../../core/components/app_button.dart';
import '../../../../core/components/app_container_par.dart';
import '../../../../core/components/app_image.dart';
import '../../../../core/components/app_input.dart';
import '../../../../core/components/app_validator.dart';
import '../../../../core/logic/helper_methods.dart';
import '../employer_details/view.dart';
import 'cubit.dart';
import 'model.dart';

class EditeEmployerView extends StatefulWidget {
  const EditeEmployerView({super.key, this.employeeId});

  final int? employeeId;

  @override
  State<EditeEmployerView> createState() => _EditeEmployerViewState();
}

class _EditeEmployerViewState extends State<EditeEmployerView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditEmployerCubit(widget.employeeId!),
      child: BlocBuilder<EditEmployerCubit, EditEmployerState>(
        builder: (context, cubit) {
          final cubit = context.read<EditEmployerCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(15.0),
                child: AppBack(
                  pass: 'arrow-left.svg',
                  onTap: () {
                    goTo(HomePage(initialIndex: 0));
                  },
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text(
                'تعديل بيانات الموظف',
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
                key: cubit.fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppContainerPar(),
                    SizedBox(height: 10.h),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          XFile? resp = await cubit.picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (resp != null) {
                            cubit.imageFile = File(resp.path);
                          }
                        },
                        child: cubit.imageFile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                  cubit.imageFile!,
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
                      controller: cubit.numberController,
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
                      controller: cubit.nameController,
                      validator: InputValidator.passwordValidator,
                    ),
                    SizedBox(height: 5.h),

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
                      controller: cubit.phoneController,
                      isKeyboardType: true,
                      validator: InputValidator.phoneValidator,
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
                      controller: cubit.addressController,
                      validator: InputValidator.phoneValidator,
                    ),
                    SizedBox(height: 5.h),

                    Text(
                      'المسمى الوظيفي',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Cairo',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    AppInput(
                      label: 'ادخل المسمى الوظيفي',
                      controller: cubit.jobTitleController,
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      'الراتب',
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
                      label: 'ادخل الراتب',
                      controller: cubit.salaryController,
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      'الرقم القومي',
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
                      label: 'ادخل الرقم القومي',
                      controller: cubit.nationalIdController,
                    ),

                    SizedBox(height: 5.h),
                    Text(
                      'الوردية',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Cairo',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    SizedBox(height: 5.h),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: DropdownButton<int>(
                        value: cubit.shifts.any((e) => e.id == cubit.shiftId)
                            ? cubit.shiftId
                            : null,
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: const Text("اختر الوردية"),
                        items: cubit.shifts.map((shift) {
                          return DropdownMenuItem<int>(
                            value: shift.id,
                            child: Text(shift.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          cubit.changeShift(value);
                        },
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      'الحالة الوظيفية',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Cairo',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: DropdownButton<String>(
                        value: cubit.status,
                        isExpanded: true,
                        underline: SizedBox(),
                        items: const [
                          DropdownMenuItem(value: 'active', child: Text('نشط')),
                          DropdownMenuItem(
                            value: 'inactive',
                            child: Text('غير نشط'),
                          ),
                          DropdownMenuItem(
                            value: 'resigned',
                            child: Text('مستقيل'),
                          ),
                        ],
                        onChanged: (value) {
                          cubit.status = value!;
                        },
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      'الصلاحية',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Cairo',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: DropdownButton<String>(
                        value: cubit.role,
                        isExpanded: true,
                        underline: SizedBox(),
                        items: const [
                          DropdownMenuItem(
                            value: 'employee',
                            child: Text('موظف'),
                          ),
                          DropdownMenuItem(
                            value: 'manager',
                            child: Text('مشرف'),
                          ),
                          DropdownMenuItem(value: 'admin', child: Text('مدير')),
                        ],
                        onChanged: (value) {
                          cubit.role = value!;
                        },
                      ),
                    ),

                    SizedBox(height: 20.h),
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: DropdownButton<int>(
                        hint: const Text("اختر القسم "),
                        value: cubit.departmentId,
                        isExpanded: true,
                        underline: SizedBox(),
                        items: cubit.departments.map((department) {
                          return DropdownMenuItem<int>(
                            value: department.id,
                            child: Text(department.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          cubit.changeDepartment(value);
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AppButton(
                      width: 390.w,
                      text: 'تعديل',
                      onPressed: () {
                        cubit.sentData();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
