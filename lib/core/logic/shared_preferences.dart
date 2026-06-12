import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static final CashHelper _instance = CashHelper._internal();

  factory CashHelper() => _instance;

  CashHelper._internal();

  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveLoginData({
    required String userId,
    String? token,
    int? id,
    String? email,
    String? phone,
  }) async {


    await _preferences.setString('user_id', userId);
    if (id != null) await _preferences.setInt('id', id);
    if (token != null) await _preferences.setString('token', token);
    if (email != null) await _preferences.setString('email', email);
    if (phone != null) await _preferences.setString('phone', phone);
  }

  static String get userId => _preferences.getString('user_id') ?? '';

  static String get token => _preferences.getString('token') ?? '';

  static bool get isAuth => token.isNotEmpty;

  static void setIsNotFirst() {
    _preferences.setBool('isFirst', false);
  }

  static bool get getIsNotFirst {
    return _preferences.getBool('isFirst') ?? true;
  }

  static Future<void> logeOut() async {
    await _preferences.remove('user_id');
    await _preferences.remove('token');
    await _preferences.remove('email');
    await _preferences.remove('phone');
    await _preferences.remove('isFirst');
  }

  static Future<void> saveThemeMode(String key, dynamic value) async {
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
}

class CashHelperKeys {
  static const String themeMode = 'themeMode';
}
