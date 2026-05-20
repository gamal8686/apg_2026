import 'package:company_apg_2026/views/pages/employer/holidays/add/state.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HolidayAddCubit extends Cubit<HolidayAddState> {
  HolidayAddCubit() : super(HolidayAddInitialState());
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final reasonController = TextEditingController();
  final durationController = TextEditingController();
  final GlobalKey<ExpansionTileCardState> tileKey = GlobalKey();
  final fromKey = GlobalKey<FormState>();
  List<String> departments = ["اعتيادى", "عارضة", "مرضى "];
  String? selectedDepartment;
  @override
  Future<void> close() {
    fromDateController.dispose();
    toDateController.dispose();
    reasonController.dispose();
    durationController.dispose();
 return   super.close();
  }
}