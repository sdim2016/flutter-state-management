import 'package:flutter/material.dart';
import 'package:inheritedwidget/inherited/data_store.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool darkTheme = false;

  @override
  void didChangeDependencies() {
    DataStore.of(context).getSettings();
    darkTheme = DataStore.of(context).darkTheme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SettingsList(
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
                      darkTheme = value;
                      DataStore.of(context).setSettings(value);
                    });
                  },
                  switchValue: darkTheme
              )
            ],
          )
        ],
      ),
    );
  }
}
