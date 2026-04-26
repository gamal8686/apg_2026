
import 'package:company_apg_2026/core/logic/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../views/auth/login/view.dart';
import 'helper_methods.dart';

enum DataState { init,loading, failed, success }

class DioHelper {
  static const _baseUrl = 'https://cosmatics.growfet.com';
  static final _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  static Future<CustomResponse> getData({String pass = ''}) async {
    _dio.options.headers.addAll({
      'Authorization': 'Bearer ${CashHelper.token}',
    });
    try {
      final resp = await _dio.get(pass);

      final Map<String, dynamic> data;

      if (resp.data is List) {
        data = {"list": resp.data};
      } else {
        data = resp.data;
      }

      return CustomResponse(mag: 'is Success', isSuccess: true, data: data);
    } on DioException catch (ex) {
      return CustomResponse(
        isSuccess: false,
        mag: ex.response?.data?['message'].toString() ?? ex.message,
      );
    }
  }

  static Future<CustomResponse> sendData({
    String pass = '',
    Map<String, dynamic>? data,
  }) async {
    _dio.options.headers.addAll({
      'Authorization': 'Bearer ${CashHelper.token}',
    });

    try {
      final resp = await _dio.post(pass, data: data);
      if (resp.statusCode == 200) {
        showMessage(resp.data['massage']);
        return CustomResponse(
          isSuccess: true,
          mag: 'isSuccess',
          data: resp.data,
        );

      } else if (resp.statusCode == 401) {
        CashHelper.logeOut();
        goTo(LoginView(), canPop: false);
      }
      return CustomResponse(
        isSuccess: true,
        mag: 'Is Success',
        data: resp.data is Map<String, dynamic> ? resp.data : null,
      );
    } on DioException catch (ex) {

      return CustomResponse(
        isSuccess: false,
        mag: ex.response?.data['message'],
      );
    }
  }
}


class CustomResponse {
  final bool isSuccess;
  final String? mag;
  final Map<String, dynamic>? data;

  CustomResponse({required this.isSuccess, required this.mag, this.data});
}