import 'package:company_apg_2026/views/pages/employer/holidays/holiday/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HolidayCubit extends Cubit<HolidayState>{
  HolidayCubit():super(HolidayInitialState());
  final fromKey = GlobalKey<FormState>();

}