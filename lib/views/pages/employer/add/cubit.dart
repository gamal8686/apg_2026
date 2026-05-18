import 'dart:io';

import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:company_apg_2026/views/pages/employer/add/stste.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddEmployerCubit extends Cubit<AddEmployerState> {
  AddEmployerCubit(): super(AddEmployerInitialState());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final numberController = TextEditingController();
  final GlobalKey<ExpansionTileCardState> tileKey = GlobalKey();
  final fromKey = GlobalKey<FormState>();
  List<String> departments = ["HR", "IT", "Sales", "Marketing", "Accounting"];
  String? selectedDepartment;
  final picker = ImagePicker();
  File? imageFile;

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    numberController.dispose();

  return  super.close();
  }
  Future <void> sentData() async {
    if(fromKey.currentState!.validate()){
      emit(AddEmployerLoadingState());
      await DioHelper.sendData(data: {},pass: '');
      emit(AddEmployerSuccessState());
    }
  }
}