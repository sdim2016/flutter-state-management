import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {

  saveSettings(bool darkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', darkMode);
  }

  Future<bool> getSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('darkMode')) await prefs.setBool('darkMode', false);
    bool darkMode = prefs.getBool('darkMode');
    return darkMode;
  }

}