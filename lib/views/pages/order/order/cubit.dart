import 'package:flutter_bloc/flutter_bloc.dart';
import '../../order/order/model.dart';
import '../add_order/state.dart';

class OrderCubit extends Cubit<OrderState>{

  final List<Model> list = [
    Model('الكل'),
    Model('وردية (أ)'),
    Model('وردية (ب)'),
    Model('وردية (ج)'),
    Model('وردية (د)'),
  ];
  int selectedIndex = 0;

  OrderCubit(): super(OrderInitialState());
}