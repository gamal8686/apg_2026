abstract class OtpState {

}

class OtpStateInitialState extends OtpState {}

class OtpStateLoadingState extends OtpState {}

class OtpStateSuccessState extends OtpState {}

class OtpStateErrorState extends OtpState {
  final bool showResend;

  OtpStateErrorState({required this.showResend});


}
