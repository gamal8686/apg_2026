abstract class HolidayState {}
class HolidayInitialState extends HolidayState {}
class HolidayLoadingState extends HolidayState {}
class HolidaySuccessState extends HolidayState {

}
class HolidayErrorState extends HolidayState {
  final String message;
  HolidayErrorState(this.message);
}