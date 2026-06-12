import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static final CashHelper _instance = CashHelper._internal();
  factory CashHelper() => _instance;
  CashHelper._internal();

  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // ===================== AUTH =====================

  static Future<void> saveLoginData({
    required String token,
    required int id,
    String? email,
    String? phone,
  }) async {
    await _preferences.setString('token', token);
    await _preferences.setInt('id', id);
    if (email != null) await _preferences.setString('email', email);
    if (phone != null) await _preferences.setString('phone', phone);
  }

  static int get userId => _preferences.getInt('id') ?? -1;

  static String get token => _preferences.getString('token') ?? '';

  static bool get isAuth => token.isNotEmpty;

  // ===================== FIRST TIME =====================

  static void setIsNotFirst() {
    _preferences.setBool('isFirst', false);
  }

  static bool get getIsNotFirst {
    return _preferences.getBool('isFirst') ?? true;
  }

  // ===================== LOGOUT =====================

  static Future<void >logeOut() async {
    await _preferences.remove('id');
    await _preferences.remove('token');
    await _preferences.remove('email');
    await _preferences.remove('phone');
  }

  // ===================== THEME =====================

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