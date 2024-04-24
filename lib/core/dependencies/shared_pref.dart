import 'package:rmo_food/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _sharedPref;
  SharedPref._internal();
  factory SharedPref() => SharedPref._internal();

  static Future<void> init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  static setToken(String value) => _sharedPref.setString(RMOConst.token, value);

  static setThemeOption(String value) =>
      _sharedPref.setString(RMOConst.themeOption, value);

  static String get getThemeOption =>
      _sharedPref.getString(RMOConst.themeOption) ?? '';

  static String? get getToken => _sharedPref.getString(RMOConst.token);
}
