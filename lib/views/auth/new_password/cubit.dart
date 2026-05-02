import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:company_apg_2026/views/auth/new_password/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordCubit extends Cubit<NewPasswordState>{
  NewPasswordCubit() : super(NewPasswordInitialState());
  final email = TextEditingController();
  final newEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> sentData() async {
   try{
     emit(NewPasswordLoadingState());
     Future.delayed(Duration(seconds: 5));
     emit(NewPasswordSuccessState());
   }catch(e){
     emit(NewPasswordErrorState());
   }
  }



}