import 'package:get/get.dart';
import 'package:getxsm/model/repositories/settings_repository.dart';

class SettingsController extends GetxController {
  final settingsRepository = SettingsRepository();

  final darkTheme = false.obs;

  @override
  void onInit() {
    getSettings();
    super.onInit();
  }

  void getSettings() {
    settingsRepository.getSettings().then((value) {
      darkTheme(value);
    });
  }

  void setSettings(bool darkMode) {
    settingsRepository.saveSettings(darkMode).then((_) {
      darkTheme(darkMode);
    });
  }


}