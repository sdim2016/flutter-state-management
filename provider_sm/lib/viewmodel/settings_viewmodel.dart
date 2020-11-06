import 'package:flutter/material.dart';
import 'package:providersm/model/repositories/settings_repository.dart';

class SettingsViewModel extends ChangeNotifier {
  final settingsRepository = SettingsRepository();

  bool darkTheme = false;

  void getSettings() {
    settingsRepository.getSettings().then((value) {
      darkTheme = value;
      notifyListeners();
      print(value);
    });
  }

  void setSettings(bool darkMode) {
    settingsRepository.saveSettings(darkMode).then((_) {
      darkTheme = darkMode;
      notifyListeners();
    });
  }

}