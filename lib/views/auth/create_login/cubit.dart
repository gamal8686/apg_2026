import 'package:company_apg_2026/core/logic/shared_preferences.dart';
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
      final response = await supabase.auth.signUp(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      final user = response.user ?? response.session?.user;

      if (user == null) {
        emit(StateCreateLoginError('فشل إنشاء الحساب'));
        return;
      }

      await CashHelper.saveLoginData(userId: user.id);

      emit(StateCreateLoginSuccess());
    } on AuthException catch (e) {
      emit(StateCreateLoginError(e.message));
    } catch (e) {
      emit(StateCreateLoginError(e.toString()));
    }finally {
      isLoading = false;
    }


  }
}
