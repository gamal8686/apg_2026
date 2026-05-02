import 'package:company_apg_2026/views/auth/forget_password/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

class ForgetPasswordCubit extends Cubit<ForgetStatePassword> {
  ForgetPasswordCubit() : super(ForgetStatePasswordInitial());
  final emailController = TextEditingController();
  final formKey  = GlobalKey<FormState>();

  Future<void> sentData() async {

    try {
      emit(ForgetStatePasswordLoading());
      await Future.delayed(Duration(seconds: 5));
      emit(ForgetStatePasswordSuccess());
    } catch (e) {
      print(e);
      emit(ForgetStatePasswordError());
    }
  }

}