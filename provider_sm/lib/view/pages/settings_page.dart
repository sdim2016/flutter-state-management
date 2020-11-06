import 'package:flutter/material.dart';
import 'package:providersm/viewmodel/settings_viewmodel.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<SettingsViewModel>(
        builder: (context, settings, child) {
          return SettingsList(
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
                        settings.setSettings(value);
                      },
                      switchValue: settings.darkTheme
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
