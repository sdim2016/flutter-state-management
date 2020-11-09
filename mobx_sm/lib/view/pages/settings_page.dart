import 'package:flutter/material.dart';
import 'package:mobxsm/model/repositories/settings_repository.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {

  final SettingsRepository settingsRepository;
  final Function setDarkTheme;

  const SettingsPage({Key key, this.settingsRepository, this.setDarkTheme}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool darkMode = false;
  bool loading = true;

  @override
  void initState() {
    widget.settingsRepository.getSettings().then((value) {
      setState(() {
        darkMode = value;
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loading ? Container() : SettingsList(
        darkBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        lightBackgroundColor: ThemeData.light().scaffoldBackgroundColor,
        sections: [
          SettingsSection(
            title: 'Theme',
            tiles: [
              SettingsTile.switchTile(
                  title: 'Dark mode',
                  leading: Icon(Icons.invert_colors),
                  onToggle: (bool value) {
                    setState(() {
                      darkMode = value;
                      widget.setDarkTheme(value);
                    });
                    widget.settingsRepository.saveSettings(darkMode);
                  },
                  switchValue: darkMode
              )
            ],
          )
        ],
      ),
    );
  }
}
