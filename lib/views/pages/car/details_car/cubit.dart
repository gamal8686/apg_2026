import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:company_apg_2026/views/pages/car/details_car/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DetailsCarCubit extends Cubit<DetailsCarState> {
  DetailsCarCubit() : super(DetailsCarInitialState());
  final _dio=GetIt.instance<DioHelper>();

  Future<void> getData() async {
    emit(DetailsCarLoadingState());

    try {
 await _dio.getData(pass: '') ;// Simulate a network call

      emit(DetailsCarSuccessState());
    } catch (e) {
      emit(DetailsCarErrorState(e.toString()));
    }
  }
}


