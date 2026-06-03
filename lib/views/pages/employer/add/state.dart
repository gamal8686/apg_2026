abstract class AddEmployerState {}
class AddEmployerInitialState extends AddEmployerState {}
class AddEmployerUpdateState extends AddEmployerState {}
class AddEmployerLoadingState extends AddEmployerState {}
class AddEmployerSuccessState extends AddEmployerState {
    final String message;
    AddEmployerSuccessState(this.message);
}
class AddEmployerErrorState extends AddEmployerState {
  final String error;
  AddEmployerErrorState(this.error);
}