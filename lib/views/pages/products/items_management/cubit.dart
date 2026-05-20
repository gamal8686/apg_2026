import 'package:company_apg_2026/views/pages/products/items_management/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsManagementCubit extends Cubit<ItemsManagementState> {
  ItemsManagementCubit() : super(ItemsManagementInitialState());

  List<int> counters = List.generate(5, (index) => 0);





}