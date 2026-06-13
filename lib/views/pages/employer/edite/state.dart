abstract class EditEmployerState {}
class EditEmployerInitialState extends EditEmployerState {}
class EditEmployerUpdateState extends EditEmployerState {}
class EditEmployerLoadingState extends EditEmployerState {}
class EditEmployerSuccessState extends EditEmployerState {
  final String message;
  EditEmployerSuccessState(this.message);
}
class EditEmployerErrorState extends EditEmployerState {
  final String error;
  EditEmployerErrorState(this.error);
}