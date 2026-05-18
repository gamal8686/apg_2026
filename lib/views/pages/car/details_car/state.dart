abstract class DetailsCarState {}
class DetailsCarInitialState extends DetailsCarState {}
class DetailsCarLoadingState extends DetailsCarState {}
class DetailsCarSuccessState extends DetailsCarState {}
class DetailsCarErrorState extends DetailsCarState {
  final String error;
  DetailsCarErrorState(this.error);
}