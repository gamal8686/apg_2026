import 'package:company_apg_2026/views/pages/employer/employer_details/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployerDetailsCubit extends Cubit<EmployerDetailsState>{
  EmployerDetailsCubit():super(EmployerDetailsInitialState());
  final ScrollController scrollController = ScrollController();
  final GlobalKey tileKey = GlobalKey();
}
