import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/extensions/string_ext.dart';
import '../enums/shared_preferences_enum.dart';

abstract class ISharedPreferencesService {
  Future<bool> setToken(String token);
  String getToken();

  bool getRememberMeValue();
  Future<bool> setRememberMeValue(bool value);

  String getIDNumber();
  Future<bool> setIDNumber(String id);

  String getPassword();
  Future<bool> setPassword(String password);

  int? getThemeMode();
  Future<bool> setThemeMode(int value);

  int? getLanguage();
  Future<bool> setLanguage(int value);

  bool? getWelcomeSeen();
  Future<bool> setWelcomeSeen(bool value);

  Future<bool> clearAllData();
}

@LazySingleton(as: ISharedPreferencesService)
class SharedPreferencesService implements ISharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  @override
  String getToken() =>
      _prefs.getString(PreferenceKeys.token.name).toString().decryptAes();

  @override
  Future<bool> setToken(String token) async =>
      _prefs.setString(PreferenceKeys.token.name, token.encryptAes());

  @override
  bool getRememberMeValue() =>
      _prefs.getBool(PreferenceKeys.rememberMe.name) ?? false;

  @override
  Future<bool> setRememberMeValue(bool value) =>
      _prefs.setBool(PreferenceKeys.rememberMe.name, value);

  @override
  String getIDNumber() =>
      _prefs.getString(PreferenceKeys.idNumber.name).toString().decryptAes();

  @override
  Future<bool> setIDNumber(String id) =>
      _prefs.setString(PreferenceKeys.idNumber.name, id.encryptAes());

  @override
  String getPassword() =>
      _prefs.getString(PreferenceKeys.password.name).toString().decryptAes();

  @override
  Future<bool> setPassword(String password) =>
      _prefs.setString(PreferenceKeys.password.name, password.encryptAes());

  @override
  int? getThemeMode() => _prefs.getInt(PreferenceKeys.theme.name);

  @override
  Future<bool> setThemeMode(int value) =>
      _prefs.setInt(PreferenceKeys.theme.name, value);

  @override
  int? getLanguage() => _prefs.getInt(PreferenceKeys.language.name);

  @override
  Future<bool> setLanguage(int value) =>
      _prefs.setInt(PreferenceKeys.language.name, value);

  @override
  bool? getWelcomeSeen() => _prefs.getBool(PreferenceKeys.welcomeSeen.name);

  @override
  Future<bool> setWelcomeSeen(bool value) =>
      _prefs.setBool(PreferenceKeys.welcomeSeen.name, value);

  @override
  Future<bool> clearAllData() async => await _prefs.clear();
}
