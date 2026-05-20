import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/views/pages/products/add_products/cubit.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/app_back.dart';
import '../../../../../core/components/app_container_par.dart';
import '../../../../../core/components/app_input.dart';
import '../../../../../core/components/app_validator.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductsCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<AddProductsCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(15.0),
                child: AppBack(pass: 'arrow-left.svg'),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text(
                'اضافه صنف جديد',
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

                    Text(
                      ' اسم الصنف ',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Cairo',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    AppInput(
                      controller: cubit.nameController,
                      label: 'ادخل الصنف',
                      validator: InputValidator.passwordValidator,
                    ),

                    SizedBox(height: 10.h),
                    Text(
                      'عبوه',
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
                     controller: cubit.addController,
                      label: 'اضف كمية العبوة',
                      validator: InputValidator.passwordValidator,
                    ),

                    SizedBox(height: 10.h),              Text(
                      'عدد الصفوف',
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
                     controller: cubit.numberOfRowsController,
                      label: 'اضف عدد الصفوف',
                      validator: InputValidator.passwordValidator,
                    ),
                    SizedBox(height: 5.h),

                    Text(
                      ' اول مكان للصنف',
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
                          cubit. selectedDepartment ?? 'اختار المكان',
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
                                    cubit.selectedDepartment = dept;
                                  });

                                  cubit.tileKey.currentState?.collapse();
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
                    AppButton(width: 390.w, text: 'حفظ  ', onPressed: () {}),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
