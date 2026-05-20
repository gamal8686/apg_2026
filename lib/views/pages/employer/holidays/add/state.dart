abstract class HolidayAddState {}
class HolidayAddInitialState extends HolidayAddState {}
class HolidayAddLoadingState extends HolidayAddState {}
class HolidayAddSuccessState extends HolidayAddState {}
class HolidayAddErrorState extends HolidayAddState {
  final String error;
  HolidayAddErrorState(this.error);
}