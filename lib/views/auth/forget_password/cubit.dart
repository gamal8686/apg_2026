import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

class ForgetPasswordCubit extends Cubit<DataState> {
  ForgetPasswordCubit() : super(DataState.init);
  final emailController = TextEditingController();
  final formKey  = GlobalKey<FormState>();

  Future<void> sentData() async {

    try {
      emit(DataState.loading);
      await Future.delayed(Duration(seconds: 5));
      emit(DataState.success);
    } catch (e) {
      print(e);
      emit(DataState.failed);
    }
  }

}