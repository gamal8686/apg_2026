import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'state.dart';

class CreateLoginCubit extends Cubit<StateCreateLogin> {
  CreateLoginCubit() : super(StateCreateLoginInitial());

  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final newPassword = TextEditingController();
  bool isLoading = false;
  final supabase = Supabase.instance.client;

  Future<void> sentData() async {
    if (isLoading) return;

    if (password.text != newPassword.text) {
      emit(StateCreateLoginError('كلمة المرور غير متطابقة'));
      return;
    }

    isLoading = true;

    emit(StateCreateLoginLoading());

    try {
      await supabase.auth.signUp(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      print('Gadea++++++++++++++++++++++++++++');

      emit(StateCreateLoginSuccess());
    } on AuthException catch (e) {
      emit(StateCreateLoginError(e.message));
    } catch (e) {
      emit(StateCreateLoginError(e.toString()));
    }

    isLoading = false;
  }
}