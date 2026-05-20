abstract class EmployerDetailsState {}
class EmployerDetailsInitialState extends EmployerDetailsState {}
class EmployerDetailsLoadingState extends EmployerDetailsState {}
class EmployerDetailsSuccessState extends EmployerDetailsState {}
class EmployerDetailsErrorState extends EmployerDetailsState {
  final String errorMessage;
  EmployerDetailsErrorState(this.errorMessage);
}
