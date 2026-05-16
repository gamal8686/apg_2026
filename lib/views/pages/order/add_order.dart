import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/views/pages/home_page.dart';
import 'package:company_apg_2026/views/pages/order/order.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_back.dart';
import '../../../../core/components/app_container_par.dart';
import '../../../../core/components/app_input.dart';
import '../../../../core/components/app_validator.dart';

class AddOrderView extends StatefulWidget {
  const AddOrderView({super.key});

  @override
  State<AddOrderView> createState() => _AddOrderViewState();
}

class _AddOrderViewState extends State<AddOrderView> {
  final instructionTitleController = TextEditingController();
  final instructionContentController = TextEditingController();

  final GlobalKey<ExpansionTileCardState> _tileKey = GlobalKey();
  final fromKey = GlobalKey<FormState>();
  List<String> departments = ["HR", "IT", "Sales", "Marketing", "Accounting"];

  String? selectedDepartment;

  @override
  void dispose() {
    instructionTitleController.dispose();
    instructionContentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppBack(pass: 'arrow-left.svg',onTap: () {
            goTo(HomePage(initialIndex: 4,));
          },),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'اضافه تعليمات جديده',
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
                'عنوان التعليمات ',
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
                controller: instructionTitleController,
                label: 'تعليمات جديده بخصوص الحضور والانصراف',
                validator: InputValidator.passwordValidator,
              ),
              SizedBox(height: 5.h),

              Text(
                'ارسال الي قسم  ',
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
              SizedBox(height: 10.h),
              Text(
                'محتوي التعليمات',
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
                isKeyboardType: true,
                controller: instructionContentController,
                label: 'اضف وصفا او ملاحظات',
                validator: InputValidator.passwordValidator,
              ),
              SizedBox(height: 30.h),
              Container(
                height: 40.h,
                width: 390.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.30),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(color: Color(0xffFFC107), width: 5.w),
                    SizedBox(width: 10.w),
                    AppImage(path: 'Attention.png', height: 20.h),
                    SizedBox(width: 5.w),

                    Text(
                      'سيتم ارسال اشعار فوري لجميع الموظفين في القسم المحدد',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              AppButton(width: 390.w, text: 'نشر التعليمات', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
