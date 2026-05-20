import 'package:company_apg_2026/views/pages/order/add_order/state.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderCubit extends Cubit<OrderState> {
  AddOrderCubit() : super(OrderInitialState());
  final instructionTitleController = TextEditingController();
  final instructionContentController = TextEditingController();

  final GlobalKey<ExpansionTileCardState> tileKey = GlobalKey();

final fromKey = GlobalKey<FormState>();
List<String> departments = ["HR", "IT", "Sales", "Marketing", "Accounting"];

String? selectedDepartment;



@override
Future<void> close() {
  instructionTitleController.dispose();
  instructionContentController.dispose();

return  super.close();
}
}