import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/views/auth/login/state.dart';
import 'package:company_apg_2026/views/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';

class LoginCubit extends Cubit<StateLogin> {
  LoginCubit() : super(StateLoginInitial());
  final email = TextEditingController(text: 'sdbvsdfbg');
  final password = TextEditingController(text: 'vfbdfvdfv');
  final formKey = GlobalKey<FormState>();

  Future<void> sentData() async {
    try {
      emit(StateLoginLoading());
      await Future.delayed(Duration(seconds: 5));
      emit(StateLoginSuccess());
    } catch (e) {
      emit(StateLoginFailed(' حدث خطأ ما'));
    }
  }
}
