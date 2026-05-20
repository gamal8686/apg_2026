import 'package:company_apg_2026/views/pages/products/product_location/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductLocationCubit extends Cubit<ProductLocationState> {
  ProductLocationCubit() : super(ProductLocationInitialState());
  List<String> list = List.generate(10, (index) => "Item $index");


}