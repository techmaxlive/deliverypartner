import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static SharedPreferences? _prefs;
  static const themekey = 'themekey';
  static const emailId = 'emailId';
  static const content = 'content';
  static const contentOrderId = 'contentOrderId';
  static const token = 'token';
  static const isLogin = 'isLogin';
  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  setDarkTheme(bool value) async {
    await initSharedPreferences();
    return _prefs!.setBool(themekey, value);
  }

  Future<bool> getDarkTheme() async {
    await initSharedPreferences();
    return _prefs!.getBool(themekey) ?? false;
  }

  setLogin(bool value) async {
    await initSharedPreferences();
    return _prefs!.setBool(isLogin, value);
  }

  Future<bool> getIsLogin() async {
    await initSharedPreferences();
    return _prefs!.getBool(isLogin) ?? false;
  }

  setContentkey(String value) async {
    await initSharedPreferences();
    return _prefs!.setString(content, value);
  }

  Future<String> getContentkey() async {
    await initSharedPreferences();
    return _prefs!.getString(content) ?? 'NA';
  }

  setEmailkey(String value) async {
    await initSharedPreferences();
    return _prefs!.setString(emailId, value);
  }

  Future<String> getEmailkey() async {
    await initSharedPreferences();
    return _prefs!.getString(emailId) ?? 'NA';
  }

  setTokenkey(String value) async {
    await initSharedPreferences();
    return _prefs!.setString(token, value);
  }

  Future<String> getTokenkey() async {
    await initSharedPreferences();
    return _prefs!.getString(token) ?? 'NA';
  }

  setOrderIdkey(String value) async {
    await initSharedPreferences();
    return _prefs!.setString(contentOrderId, value);
  }

  Future<String> getOrderIdkey() async {
    await initSharedPreferences();
    return _prefs!.getString(contentOrderId) ?? 'NA';
  }

// clean  //
  Future<bool> clearData() async {
    await initSharedPreferences();
    return _prefs!.clear();
  }
}
