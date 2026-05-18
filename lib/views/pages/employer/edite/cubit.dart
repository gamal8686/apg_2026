import 'dart:io';

import 'package:company_apg_2026/views/pages/employer/edite/state.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditEmployerCubit extends Cubit<EditeState> {
  EditEmployerCubit(): super(EditeInitialState());
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
  Future<void > sentData() async {
    if (fromKey.currentState!.validate()) {
      emit(EditeLoadingState());
      try {
        // Simulate a network request or data processing
        await Future.delayed(Duration(seconds: 2));
        emit(EditeSuccessState());
      } catch (e) {
        emit(EditeErrorState(e.toString()));
      }
    }
  }

   Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      emit(EditeSuccessState()); // Emit success state after picking image
    } else {
      emit(EditeErrorState("No image selected")); // Emit error state if no image is selected
    }
  }
}