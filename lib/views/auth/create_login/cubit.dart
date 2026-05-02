import 'package:company_apg_2026/views/auth/create_login/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateLoginCubit extends Cubit<StateCreateLogin> {
  CreateLoginCubit() : super(StateCreateLoginInitial());
  final name = TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();

  final newPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> sentData() async {
    try {
      emit(StateCreateLoginLoading());

      await Future.delayed(Duration(seconds: 5));
      emit(StateCreateLoginSuccess());
    } catch (e) {
      emit(StateCreateLoginFailed());
    }
  }
}
