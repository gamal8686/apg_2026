abstract class EditeState {}
class EditeInitialState extends EditeState {}
class EditeLoadingState extends EditeState {}
class EditeSuccessState extends EditeState {}
class EditeErrorState extends EditeState {
  final String error;
  EditeErrorState(this.error);
}