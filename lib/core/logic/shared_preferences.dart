import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static final CashHelper _instance = CashHelper._internal();
 factory CashHelper()=> _instance;
  CashHelper._internal();
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

  static Future<void> logeOut() async {
    await _preferences.remove('id');
    await _preferences.remove('token');
    await _preferences.remove('email');
    await _preferences.remove('phoneNumber');
    await _preferences.remove('countryCode');
  }

  static Future<void> saveThemeMode( String key, dynamic value) async {
    if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is List<String>) {
      await _preferences.setStringList(key, value);
    } else {
      throw Exception('Unsupported type');
    }
  }
 static dynamic getThemeMode(String key) {
    return _preferences.get(key);
  }
  Future<void> removeThemeMode(String key) async {
    await _preferences.remove(key);
  }

  // static Future<void> saveUserData(User model) async {
  //   _preferences.setInt('id', model.user?.id??0);
  //   _preferences.setString('token', model.token);
  //   _preferences.setString('email', model.user?.email??'');
  //   _preferences.setString('phoneNumber', model.user?.phoneNumber??'');
  //   _preferences.setString('countryCode', model.user?.countryCode??'');
  // }
}
class CashHelperKeys {
  static const String themeMode = 'themeMode';
  }