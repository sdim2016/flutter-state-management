import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxsm/mobx/settings_view_model.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Observer(
        builder: (context) {
          final settingsViewModel = Provider.of<SettingsViewModel>(context);
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
                        settingsViewModel.setSettings(value);
                      },
                      switchValue: settingsViewModel.darkTheme
                  )
                ],
              )
            ],
          );
        }
      ),
    );
  }
}
