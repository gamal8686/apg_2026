import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:company_apg_2026/views/pages/car/add_car/state.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AddCarCubit extends Cubit<AddCarState> {
  AddCarCubit() : super(AddCarInitialState());
  final _dio=GetIt.instance<DioHelper>();
  //todo GetIt whit DioHelper
  final nameController = TextEditingController();
  final numberPackagesController = TextEditingController();
  final dateRegistrationController = TextEditingController();
  final packageDescriptionController = TextEditingController();
  final numberController = TextEditingController();
  final GlobalKey<ExpansionTileCardState> tileKey = GlobalKey();
  final fromKey = GlobalKey<FormState>();
  List<String> departments = [
    "ايبكو",
    "المهن",
    "الشركة العربية",
    "ادكوا",
    "Accounting",
  ];
  String? selectedDepartment;

  @override
  Future<void> close() {
    nameController.dispose();
    numberPackagesController.dispose();
    dateRegistrationController.dispose();
    numberController.dispose();
    packageDescriptionController.dispose();

    return super.close();
  }

  Future<void> sendData() async {
    if (fromKey.currentState!.validate()) {
      emit(AddCarLoadingState());
      try {
        await _dio.sendData(
          pass: '',
          data: {
            "name": nameController.text,
            "number_packages": numberPackagesController.text,
            "date_registration": dateRegistrationController.text,
            "package_description": packageDescriptionController.text,
            "number": numberController.text,
            "department": selectedDepartment,
          },
        );

        emit(AddCarSuccessState());
      } catch (e) {
        emit(AddCarFailedState(e.toString()));
      }
    }
  }
}
