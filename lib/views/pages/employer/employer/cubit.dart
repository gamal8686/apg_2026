import 'package:company_apg_2026/views/pages/employer/employer/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model.dart';





class EmployerCubit  extends Cubit<EmployerState>{
  EmployerCubit(): super(EmployerInitialState());

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
  List<EmployeeModel> employees = [
    EmployeeModel(
      id: '1',
      name: 'جمال أسامة',
      department: 'المحاسبة',
      jobTitle: 'محاسب',
      phone: '01065953330',
      email: 'test@gmail.com',
      image: 'https://...',
      shift: 'الصباحية',
    ),

    EmployeeModel(
      id: '2',
      name: 'محمد أحمد',
      department: 'المبيعات',
      jobTitle: 'مندوب مبيعات',
      phone: '01111111111',
      email: 'sales@gmail.com',
      image: 'https://...',
      shift: 'المسائية',
    ),
  ];
  int isSelected = 0;
  int selectedIndex = 0;
  Future <void> changeSelected(int index) async {
    isSelected = index;
    emit(EmployerLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(EmployerSuccessState());
  }

}
