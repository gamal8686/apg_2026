import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/views/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';

class LoginCubit extends Cubit<DataState> {
  LoginCubit() : super(DataState.init);
  final email = TextEditingController();
  final password = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  Future<void> sentData() async {
    try {
      emit(DataState.loading);
      await Future.delayed(Duration(seconds: 5));
      emit(DataState.success);
    } catch (e) {
      emit(DataState.failed);
    }
  }
}
