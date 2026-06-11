import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'state.dart';
import 'model.dart';

class EmployerCubit extends Cubit<EmployerState> {
  EmployerCubit() : super(EmployerInitialState()) {
    init();
  }

  List<DepartmentModel> departments = [];
  List<EmployeeModel> allEmployees = [];
  List<EmployeeModel> filteredEmployees = [];

  int selectedIndex = 0;

  Future<void> init() async {
    await getDepartments();
    await getEmployees();
  }

  Future<void> getDepartments() async {
    final response = await Supabase.instance.client
        .from('departments')
        .select();

    departments = (response as List)
        .map((e) => DepartmentModel.fromJson(e))
        .toList();

    emit(EmployerSuccessState());
  }

  Future<void> getEmployees() async {
    emit(EmployerLoadingState());

    final response = await Supabase.instance.client
        .from('employees')
        .select('*, departments(name)');

    allEmployees = (response as List)
        .map((e) => EmployeeModel.fromJson(e))
        .toList();

    filteredEmployees = List.from(allEmployees);

    emit(EmployerSuccessState());
  }

  void changeDepartment(int index) {
    selectedIndex = index;

    final departmentName = departments[index].name;

    filteredEmployees = allEmployees.where((e) {
      return e.department.trim().toLowerCase() ==
          departmentName.trim().toLowerCase();
    }).toList();

    emit(EmployerSuccessState());
  }

  void reset() {
    selectedIndex = 0;
    filteredEmployees = List.from(allEmployees);
    emit(EmployerSuccessState());
  }
}