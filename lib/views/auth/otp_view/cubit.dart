import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtbCubit extends Cubit<DataState> {
  OtbCubit() : super(DataState.init);
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  bool showResend = false;

  Future<void> sentData() async {
    emit(DataState.loading);
    try {
      await Future.delayed(Duration(seconds: 5));

      emit(DataState.success);
    } catch (e) {
      showResend= true;
      emit(DataState.failed);
    }
  }
}
