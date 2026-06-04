import 'package:company_apg_2026/views/pages/home_page/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../car/car/view.dart';
import '../category/view.dart';
import '../employer/employer/view.dart';
import '../order/order/view.dart';
import '../products/product/view.dart';

class HomepageCubit extends Cubit<HomePageState>{
  HomepageCubit({this.initialIndex = 0})
      : currentIndex = initialIndex,
        super(HomePageInitialState());
  int currentIndex ;

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomePageChangeBottomNavState());
  }
  final int initialIndex;
  final List<Model> list = [
    //todo
    //if(Admin.isAdmin)
    Model(CategoryPage()),
    Model(ProductPage()),
    Model(CarView()),
    Model(EmployerView()),
    Model(OrderPage()),


  ];

}
class Model {
  final Widget page;

  Model(this.page);
}