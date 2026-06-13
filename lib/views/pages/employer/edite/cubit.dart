

import 'dart:io';

import 'package:company_apg_2026/views/pages/employer/edite/state.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/logic/helper_methods.dart';
import '../../home_page/view.dart';
import 'model.dart';

class EditEmployerCubit extends Cubit<EditEmployerState> {
  final int employeeId;
  EditEmployerCubit(this.employeeId) : super(EditEmployerLoadingState()) {
    Future.delayed(Duration.zero, () {
      getDepartments();
      getShifts();
      getEmployeeData();
    });
  }

  final nameController = TextEditingController(text: '  Gamal osama');

  final phoneController = TextEditingController(text: '  01065953330');
  final addressController = TextEditingController(text: '  abrag rawda');
  final numberController = TextEditingController(text: '  1390');
  final jobTitleController = TextEditingController(text: 'driver');
  final salaryController = TextEditingController(text: ' 12000');
  final nationalIdController = TextEditingController(text: ' 8888888888');

  String status = 'active';
  String role = 'employee';
  int? departmentId;
  int? shiftId;
  final GlobalKey<ExpansionTileCardState> tileKey = GlobalKey();
  final fromKey = GlobalKey<FormState>();
  List<Department> departments = [];
  List<Shift> shifts = [];
  String? selectedDepartment;
  final picker = ImagePicker();
  File? imageFile;
  final user = Supabase.instance.client.auth.currentUser;

  @override
  Future<void> close() {
    nameController.dispose();

    phoneController.dispose();
    addressController.dispose();
    numberController.dispose();

    return super.close();
  }

  Future<void> getDepartments() async {
    final response = await Supabase.instance.client
        .from('departments')
        .select();

    departments = (response as List)
        .map((e) => Department.fromJson(e))
        .toList();

    emit(EditEmployerUpdateState());
  }
  Future<void> getEmployeeData() async {
    final response = await Supabase.instance.client
        .from('employees')
        .select()
        .eq('id', employeeId)
        .single();

    nameController.text = response['name'] ?? '';
    phoneController.text = response['phone'] ?? '';
    addressController.text = response['address'] ?? '';
    numberController.text = response['employee_number'] ?? '';
    jobTitleController.text = response['job_title'] ?? '';
    salaryController.text = response['salary'].toString();
    nationalIdController.text = response['national_id'] ?? '';

    status = response['status']?? 'active';
    role = response['role']??'employee';
    departmentId = response['department_id'] != null
        ? int.tryParse(response['department_id'].toString())
        : null;
    shiftId = response['shift_id'] != null
        ? int.tryParse(response['shift_id'].toString())
        : null;

    emit(EditEmployerUpdateState());
  }
  Future<String> uploadImage() async {
    if (imageFile == null) return '';

    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

    await Supabase.instance.client.storage
        .from('employees')
        .upload(fileName, imageFile!);

    final imageUrl = Supabase.instance.client.storage
        .from('employees')
        .getPublicUrl(fileName);

    return imageUrl;
  }

  void changeShift(int? value) {
    shiftId = value;
    emit(EditEmployerUpdateState());
  }

  void changeDepartment(int? value) {
    departmentId = value;
    emit(EditEmployerUpdateState());
  }

  Future<void> getShifts() async {


    final response = await Supabase.instance.client.from('shifts').select();

    print("SHIFTS RESPONSE: $response");

    shifts = (response as List).map((e) => Shift.fromJson(e)).toList();

    emit(EditEmployerUpdateState());
  }

  Future<void> sentData() async {
    if (fromKey.currentState!.validate()) {
      emit(EditEmployerLoadingState());

      try {
        String? imageUrl;

        if (imageFile != null) {
          imageUrl = await uploadImage();
        }

        await Supabase.instance.client
            .from('employees')
            .update({
          'employee_number': numberController.text,
          'name': nameController.text,
          'phone': phoneController.text,
          'address': addressController.text,
          'department_id': departmentId,
          'shift_id': shiftId,
          'job_title': jobTitleController.text,
          'salary': salaryController.text,
          'national_id': nationalIdController.text,
          'status': status,
          'role': role,
          if (imageUrl != null) 'image': imageUrl,
        })
            .eq('id', employeeId);

        emit(EditEmployerSuccessState("تم تعديل البيانات بنجاح ✅"));

        goTo(HomePage(initialIndex: 0));
      } on PostgrestException catch (e) {
        emit(EditEmployerErrorState(e.message));
      }
    }
  }
}
