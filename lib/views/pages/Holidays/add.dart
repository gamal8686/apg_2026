import 'package:company_apg_2026/core/components/app_button.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_back.dart';
import '../../../../core/components/app_container_par.dart';
import '../../../../core/components/app_input.dart';
import '../../../../core/components/app_validator.dart';
import '../../../core/logic/data.dart';

class AddHolidayView extends StatefulWidget {
  const AddHolidayView({super.key});

  @override
  State<AddHolidayView> createState() => _AddHolidaysViewState();
}

class _AddHolidaysViewState extends State<AddHolidayView> {
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final reasonController = TextEditingController();
  final durationController = TextEditingController();
  final GlobalKey<ExpansionTileCardState> _tileKey = GlobalKey();
  final fromKey = GlobalKey<FormState>();
  List<String> departments = ["اعتيادى", "عارضة", "مرضى "];
  String? selectedDepartment;

  @override
  void dispose() {
    fromDateController.dispose();
    toDateController.dispose();
    reasonController.dispose();
    durationController.dispose();
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
          'طلب اجازه',
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
                'نوع الاجازه  ',
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
                    selectedDepartment ?? 'اختار نوع الاجازة',
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
                'من تاريخ   ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () async {
                  final selectedDates = await showDatePickerBottomSheet(context);

                  if (selectedDates.isNotEmpty) {
                    final from = selectedDates.first;
                    final to = selectedDates.length > 1
                        ? selectedDates.last
                        : selectedDates.first;

                    setState(() {
                      fromDateController.text =
                      "${from!.day}/${from.month}/${from.year}";

                      toDateController.text =
                      "${to!.day}/${to.month}/${to.year}";
                      final days = to.difference(from).inDays + 1;

                      durationController.text = "$days يوم";
                    });
                  }
                },
                child: AbsorbPointer(
                  child: AppInput(
                    isData: true,
                    label: 'من يوم',
                    controller: fromDateController,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'الي تاريخ',
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
                label: 'الى تاريخ',
                controller: toDateController,
                validator: InputValidator.phoneValidator,
                isKeyboardType: true,
              ),
              SizedBox(height: 5.h),
              Text(
                'السبب(اختياري)',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              AppInput(
                maxLines: 3,
                label: 'اضف وصفا او ملاحظات',
                controller: reasonController,
                validator: InputValidator.phoneValidator,
              ),
              SizedBox(height: 5.h),
              Text(
                'مده الاجازه ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 5.h),
              AppInput(
                fillColor: Color(0xffF8D5C1),
                label: 'كام يوم',
                isKeyboardType: true,
                controller: durationController,
                validator: InputValidator.phoneValidator,
              ),

              AppButton(width: 390.w, text: 'ارسال طلب ',  onPressed: () {

                if (fromKey.currentState!.validate()) {

                  HolidayModel holiday = HolidayModel(

                    type: selectedDepartment ?? '',

                    fromDate: fromDateController.text,

                    toDate: toDateController.text,

                    reason: reasonController.text,

                    duration: durationController.text,

                    status: 'pending',
                  );

                  // Navigator.push(
                  //   context,
                  //
                  //   MaterialPageRoute(
                  //     builder: (_) => HolidayDetailsView(
                  //       holiday: holiday,
                  //     ),
                  //   ),
                  // );
                }
              },),
            ],
          ),
        ),
      ),
    );
  }
}
class HolidayModel {

  final String type;
  final String fromDate;
  final String toDate;
  final String reason;
  final String duration;
  final String status;

  HolidayModel({
    required this.type,
    required this.fromDate,
    required this.toDate,
    required this.reason,
    required this.duration,
    required this.status,
  });
}