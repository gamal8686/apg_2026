import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'state.dart';

class LoginCubit extends Cubit<StateLogin> {
  LoginCubit() : super(StateLoginInitial());

  final formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();

  final supabase = Supabase.instance.client;

  Future<void> sentData() async {
    try {
      emit(StateLoginLoading());

      await supabase.auth.signInWithPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      emit(StateLoginSuccess());
    } on AuthException catch (e) {
      emit(StateLoginError(e.message));
    } catch (e) {
      emit(StateLoginError(e.toString()));
    }
  }
}