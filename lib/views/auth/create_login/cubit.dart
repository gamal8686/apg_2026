import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../../pages/home_page.dart';



class CreateLoginCubit extends Cubit<DataState> {
  CreateLoginCubit() : super(DataState.init);
  final name = TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();

  final newPassword = TextEditingController();
  final fromKey = GlobalKey<FormState>();


  Future<void> sentData() async {

try{
  emit(DataState.loading);

  await Future.delayed(Duration(seconds: 2));
  emit(DataState.success);

  goTo(HomePage());
}catch(e){
  emit(DataState.failed);

}


}
  }