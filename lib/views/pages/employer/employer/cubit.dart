import 'package:company_apg_2026/views/pages/employer/employer/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../order/order/model.dart';





class EmployerCubit  extends Cubit<EmployerState>{
  EmployerCubit(): super(EmployerInitialState());
  final List<Model> models = [
    Model('الكل',),
    Model('المالية'),
    Model('التكاليف'),
    Model('شئون العاملين'),
    Model('المبيعات'),
    Model('المشتريات'),
    Model('الجراج والحركة'),
    Model('المنتج النهائى'),
    Model('الفحص'),
    Model('i.s'),
  ];
  final Map<String, List<String>> subData = {
    'الكل': ['موظف 1', 'موظف 2', 'موظف 3'],
    'المالية': ['محاسب 1', 'محاسب 2'],
    'التكاليف': ['تكلفة 1', 'تكلفة 2'],
    'شئون العاملين': ['HR 1', 'HR 2'],
    'المبيعات': ['Sales 1', 'Sales 2'],
    'المشتريات': ['Buy 1', 'Buy 2'],
    'الجراج والحركة': ['Car 1', 'Car 2'],
    'المنتج النهائى': ['Prod 1', 'Prod 2'],
    'الفحص': ['Check 1', 'Check 2'],
    'i.s': ['IS 1', 'IS 2'],
  };

  int isSelected = 0;
  int selectedIndex = 0;
  Future <void> changeSelected(int index) async {
    isSelected = index;
    emit(EmployerLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(EmployerSuccessState());
  }

}
