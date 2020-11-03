import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {

  saveSettings(bool darkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', darkMode);
  }

  Future<bool> getSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool darkMode = prefs.getBool('darkMode');
    return darkMode;
  }

}