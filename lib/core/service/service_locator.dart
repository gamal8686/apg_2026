import 'package:company_apg_2026/core/logic/dio_helper.dart';
import 'package:get_it/get_it.dart';

import '../../views/auth/Create_Login/cubit.dart';
import '../../views/auth/forget_password/cubit.dart';
import '../../views/auth/login/cubit.dart';
import '../../views/auth/new_password/cubit.dart';

import '../../views/auth/otp_view/cubit.dart';
import '../../views/pages/car/add_car/cubit.dart';
import '../../views/pages/car/car/cubit.dart';
import '../../views/pages/car/details_car/cubit.dart';
import '../../views/pages/employer/add/cubit.dart';
import '../../views/pages/employer/edite/cubit.dart';
import '../../views/pages/employer/employer/cubit.dart';
import '../../views/pages/employer/employer_details/cubit.dart';
import '../../views/pages/employer/holidays/add/cubit.dart';
import '../../views/pages/employer/holidays/holiday/cubit.dart';
import '../../views/pages/home_page/cubit.dart';
import '../../views/pages/order/add_order/cubit.dart';
import '../../views/pages/order/order/cubit.dart';
import '../../views/pages/products/add_products/cubit.dart';
import '../../views/pages/products/items_management/cubit.dart';
import '../../views/pages/products/product_location/cubit.dart';

final box = GetIt.instance;

void initGetIt() {
  box.registerLazySingleton(() => DioHelper());
  box.registerFactory(() => CreateLoginCubit());
  box.registerFactory(() => ForgetPasswordCubit());
  box.registerFactory(() => LoginCubit());
  box.registerFactory(() => NewPasswordCubit());
  box.registerFactory(() => OtpCubit());
  box.registerFactory(() => CarCubit());
  box.registerFactory(() => AddCarCubit());
  box.registerFactory(() => DetailsCarCubit()..getData());
  box.registerFactory(() => AddEmployerCubit());
  box.registerFactory(() => EditEmployerCubit());
  box.registerFactory(() => EmployerCubit());
  box.registerFactory(() => EmployerDetailsCubit());
  box.registerFactory(() => HolidayAddCubit());
  box.registerFactory(() => HolidayCubit());
  box.registerFactory(() => AddOrderCubit());
  box.registerFactory(() => OrderCubit());
  box.registerFactory(() => AddProductsCubit());
  box.registerFactory(() => ItemsManagementCubit());
  box.registerFactory(() => ProductLocationCubit());
  box.registerFactory(() => HomepageCubit());
}
