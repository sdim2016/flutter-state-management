import 'package:blocsm/bloc/settings_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of(context, listen: true);
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
                    settingsBloc.add(SetSettingsEvent(value));
                  },
                  switchValue: (settingsBloc.state as SettingsObtainedState).darkTheme
              )
            ],
          )
        ],
      ),
    );
  }
}
