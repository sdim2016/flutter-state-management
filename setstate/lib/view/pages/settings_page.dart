import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
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
                  onToggle: (bool value) {},
                  switchValue: true
              )
            ],
          )
        ],
      ),
    );
  }
}
