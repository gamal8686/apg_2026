abstract class HomePageState {}
class HomePageInitialState extends HomePageState {}
class HomePageLoadingState extends HomePageState {}
class HomePageSuccessState extends HomePageState {}
class HomePageChangeBottomNavState extends HomePageState {}
class HomePageErrorState extends HomePageState {
  final String error;
  HomePageErrorState(this.error);
}