abstract class AddEmployerState {}
class AddEmployerInitialState extends AddEmployerState {}
class AddEmployerLoadingState extends AddEmployerState {}
class AddEmployerSuccessState extends AddEmployerState {}
class AddEmployerErrorState extends AddEmployerState {
  final String error;
  AddEmployerErrorState(this.error);
}