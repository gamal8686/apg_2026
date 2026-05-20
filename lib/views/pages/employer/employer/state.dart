abstract class EmployerState {}
class EmployerInitialState extends EmployerState {}
class EmployerLoadingState extends EmployerState {}
class EmployerSuccessState extends EmployerState {}
class EmployerErrorState extends EmployerState {
  final String error;
  EmployerErrorState(this.error);
}