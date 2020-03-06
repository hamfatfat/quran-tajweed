

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String  page ="page";

  /// ------------------------------------------------------------
  /// Method that returns the user page,if not set
  /// ------------------------------------------------------------
  static Future<int> getPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(page) ?? 0;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------
  static Future<bool> setPage(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt(page, value);
  }
}