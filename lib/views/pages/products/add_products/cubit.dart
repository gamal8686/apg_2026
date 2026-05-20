import 'package:company_apg_2026/views/pages/products/add_products/state.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductsCubit extends Cubit<AddProductsState>{
  AddProductsCubit(): super(AddProductsInitialState());

  final GlobalKey<ExpansionTileCardState> tileKey = GlobalKey();
  final fromKey = GlobalKey<FormState>();
  List<String> departments = ["مخزن A", "مخزن B", "مخزن C", "مخزن F", "Accounting"];
  final nameController = TextEditingController();
  final addController = TextEditingController();
  final numberOfRowsController = TextEditingController();
  String? selectedDepartment;

  @override
  Future<void> close() {
    nameController.dispose();
    addController.dispose();
    numberOfRowsController.dispose();

   return super.close();
  }
}
