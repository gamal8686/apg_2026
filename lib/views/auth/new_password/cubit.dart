import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordCubit extends Cubit<DataState>{
  NewPasswordCubit() : super(DataState.init);
  final email = TextEditingController();
  final newEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> sentData() async {
   try{
     emit(DataState.loading);
     Future.delayed(Duration(seconds: 5));
     emit(DataState.success);
   }catch(e){
     emit(DataState.failed);
   }
  }



}