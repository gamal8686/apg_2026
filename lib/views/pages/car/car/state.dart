 abstract class  CarState {}
 class CarInitialState extends CarState {}
  class CarLoadingState extends CarState {}
  class CarSuccessState extends CarState {}
  class CarFailedState extends CarState {
  final String error;
  CarFailedState(this.error);
}