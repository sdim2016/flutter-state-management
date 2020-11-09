import 'package:mobx/mobx.dart';
import 'package:mobxsm/model/repositories/settings_repository.dart';

part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModel with _$SettingsViewModel;

abstract class _SettingsViewModel with Store {
  final SettingsRepository settingsRepository = SettingsRepository();

  @observable
  bool darkTheme = false;

  @action
  void getSettings() {
    settingsRepository.getSettings().then((value) {
      darkTheme = value;
    });
  }

  @action
  void setSettings(bool darkMode) {
    darkTheme = darkMode;
    settingsRepository.saveSettings(darkMode);
  }

}