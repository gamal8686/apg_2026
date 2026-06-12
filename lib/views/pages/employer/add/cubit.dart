import 'dart:io';

import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/views/pages/employer/add/state.dart';
import 'package:company_apg_2026/views/pages/home_page/view.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'model.dart';

class AddEmployerCubit extends Cubit<AddEmployerState> {
  AddEmployerCubit() : super(AddEmployerInitialState()) {
    Future.delayed(Duration.zero, () {
      getDepartments();
      getShifts();
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
  List<Shift> shifts = [

  ];
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

    emit(AddEmployerUpdateState());
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
    emit(AddEmployerUpdateState());
  }
  void changeDepartment(int? value) {
    departmentId = value;
    emit(AddEmployerUpdateState());
  }
  Future<void> getShifts() async {
    print("Loading shifts...");

    final response = await Supabase.instance.client
        .from('shifts')
        .select();

    print("SHIFTS RESPONSE: $response");

    shifts = (response as List)
        .map((e) => Shift.fromJson(e))
        .toList();

    emit(AddEmployerUpdateState());
  }

  Future<void> sentData() async {
    if (fromKey.currentState!.validate()) {
      if (shiftId == null || departmentId == null) {
        showMessage("من فضلك اختار القسم والوردية");
        return;
      }
      emit(AddEmployerLoadingState());

      try {
        String imageUrl = '';

        if (imageFile != null) {
          imageUrl = await uploadImage();
        }
        final user = Supabase.instance.client.auth.currentUser;

        if (user == null) {
          emit(AddEmployerErrorState('لا يوجد مستخدم مسجل دخول'));
          return;
        }
        final response =
            await Supabase.instance.client.from('employees').insert({
              'employee_number': numberController.text,
              'name': nameController.text,
              'phone': phoneController.text,
              'address': addressController.text,

              'department_id': departmentId,
              'shift_id': shiftId,

              'image': imageUrl,
              'job_title': jobTitleController.text,
              'salary': salaryController.text,
              'national_id': nationalIdController.text,
              'status': status,
              'role': role,
              'user_id': Supabase.instance.client.auth.currentUser!.id,
            }).select();


        print("USER ID = ${Supabase.instance.client.auth.currentUser?.id}");




        emit(AddEmployerSuccessState("تم إضافة الموظف بنجاح ✅"));
        goTo(HomePage(initialIndex: 0));
      } on PostgrestException catch (e) {
        print(e);
    print("MESSAGE: ${e.message}");
    print("DETAILS: ${e.details}");
    print("CODE: ${e.code}");
    print("HINT: ${e.hint}");
    emit(AddEmployerErrorState(e.toString()));

    }





    }
  }
}
