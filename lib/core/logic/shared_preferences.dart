import 'package:shared_preferences/shared_preferences.dart';


class CashHelper {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void setIsNotFirst() {
    _preferences.setBool('isFirst', false);
  }

  static bool get getIsNotFirst {
    return _preferences.getBool('isFirst') ?? true;
  }
  static String get token {
    return _preferences.getString('token') ?? '';
  }
  static bool get isAuth {
    return (_preferences.getString('token') ?? '').isNotEmpty;
  }
static Future<void> logeOut ()async{
    await _preferences.remove('id');
    await _preferences.remove('token');
    await _preferences.remove('email');
    await _preferences.remove('phoneNumber');
    await _preferences.remove('countryCode');
}
  // static Future<void> saveUserData(User model) async {
  //   _preferences.setInt('id', model.user?.id??0);
  //   _preferences.setString('token', model.token);
  //   _preferences.setString('email', model.user?.email??'');
  //   _preferences.setString('phoneNumber', model.user?.phoneNumber??'');
  //   _preferences.setString('countryCode', model.user?.countryCode??'');
  // }
}
