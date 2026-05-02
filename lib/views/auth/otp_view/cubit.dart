import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:company_apg_2026/views/auth/otp_view/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtbCubit extends Cubit<OtpState> {
  OtbCubit() : super(OtpStateInitialState());
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();

  Future<void> sentData() async {
    emit(OtpStateLoadingState());
    try {
      await Future.delayed(Duration(seconds: 5));

      emit(OtpStateSuccessState());
    } catch (e) {
      emit(OtpStateErrorState(showResend: true));
    }
  }
}
