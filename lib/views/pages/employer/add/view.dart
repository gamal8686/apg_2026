import 'dart:io';

import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/views/pages/employer/add/cubit.dart';
import 'package:company_apg_2026/views/pages/employer/add/state.dart';
import 'package:company_apg_2026/views/pages/home_page/view.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/components/app_back.dart';
import '../../../../core/components/app_container_par.dart';
import '../../../../core/components/app_image.dart';
import '../../../../core/components/app_input.dart';
import '../../../../core/components/app_validator.dart';
import '../employer/view.dart';

class AddEmployerView extends StatefulWidget {
  const AddEmployerView({super.key});

  @override
  State<AddEmployerView> createState() => _AddEmployerViewState();
}

class _AddEmployerViewState extends State<AddEmployerView> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AddEmployerCubit(),
    child: BlocConsumer<AddEmployerCubit, AddEmployerState>(
      listener: (context, state) {
        if (state is AddEmployerSuccessState) {
          showMessage('تم إضافة الموظف بنجاح');

          Navigator.pop(context);
        }

        if (state is AddEmployerErrorState) {
          showMessage(state.error);
        }
      },
      builder: (context, state) {
        return Builder(
          builder: (context) {
            final cubit = context.read<AddEmployerCubit>();
            return Scaffold(
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: AppBack(
                    pass: 'arrow-left.svg',
                    onTap: () {
                      goTo(HomePage(initialIndex: 3));
                    },
                  ),
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
                              setState(() {
                                cubit.imageFile = File(resp.path);
                              });
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
                        validator: InputValidator.phoneValidator,
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
                        controller: cubit.addressController,
                        validator: InputValidator.phoneValidator,
                      ),
                      SizedBox(height: 5.h),
                      // ===== Job Title =====
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

// ===== Salary =====
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

// ===== National ID =====
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
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: DropdownButton<int>(
                          value: cubit.shiftId,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: const [
                            DropdownMenuItem(value: 1, child: Text('وردية    أ')),
                            DropdownMenuItem(value: 2, child: Text('وردية    ب')),
                            DropdownMenuItem(value: 3, child: Text('وردية    ج ')),
                            DropdownMenuItem(value: 4, child: Text('وردية    د')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              cubit.shiftId = value!;
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 5.h),

// ===== Status =====
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
                            DropdownMenuItem(value: 'inactive', child: Text('غير نشط')),
                            DropdownMenuItem(value: 'resigned', child: Text('مستقيل')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              cubit.status = value!;
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 5.h),

// ===== Role =====
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
                            DropdownMenuItem(value: 'employee', child: Text('موظف')),
                            DropdownMenuItem(value: 'manager', child: Text('مشرف')),
                            DropdownMenuItem(value: 'admin', child: Text('مدير')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              cubit.role = value!;
                            });
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: ExpansionTileCard(
                          key: cubit.tileKey,

                          elevation: 0,
                          baseColor: Colors.transparent,
                          expandedColor: Colors.white,
                          shadowColor: Colors.transparent,

                          onExpansionChanged: (isExpanded) {
                            if (isExpanded) {
                              Future.delayed(Duration(milliseconds: 300), () {
                                Scrollable.ensureVisible(
                                  cubit.tileKey.currentContext!,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              });
                            }
                          },

                          title: Text(
                            cubit.selectedDepartment ?? 'اختار القسم',
                            style: TextStyle(
                              fontSize: 16,
                              color: cubit.selectedDepartment == null
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),

                          trailing: Icon(Icons.arrow_drop_down),

                          children: [
                            Column(
                              children: cubit.departments.map((dept) {
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      cubit.departmentId = dept.id;
                                      cubit.selectedDepartment = dept.name;
                                    });

                                    cubit.tileKey.currentState?.collapse();
                                  },
                                  leading: Icon(Icons.apartment),
                                  title: Text(dept.name),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      AppButton(
                        width: 390.w,
                        text: 'حفظ',
                        onPressed: () {
                          cubit.sentData();
                        },
                        isLoading: state is AddEmployerLoadingState
                            ? true
                            : false,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
