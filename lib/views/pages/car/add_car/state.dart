abstract class AddCarState {}
class AddCarInitialState extends AddCarState {}
  class AddCarLoadingState extends AddCarState {}
  class AddCarSuccessState extends AddCarState {}
  class AddCarFailedState extends AddCarState {
  final String error;
  AddCarFailedState(this.error);
}