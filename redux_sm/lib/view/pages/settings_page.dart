import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxsm/redux/actions.dart';
import 'package:reduxsm/redux/app_state.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel(darkTheme: store.state.darkTheme, onPressed: (darkTheme) => store.dispatch(SaveSettings(darkTheme))),
        builder: (context, viewModel) {
          return SettingsList(
            darkBackgroundColor: ThemeData
                .dark()
                .scaffoldBackgroundColor,
            lightBackgroundColor: ThemeData
                .light()
                .scaffoldBackgroundColor,
            sections: [
              SettingsSection(
                title: 'Theme',
                tiles: [
                  SettingsTile.switchTile(
                      title: 'Dark mode',
                      leading: Icon(Icons.invert_colors),
                      onToggle: (bool value) {
                        viewModel.onPressed(value);
                      },
                      switchValue: viewModel.darkTheme
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

class _ViewModel {
  final bool darkTheme;
  final void Function(bool darkTheme) onPressed;

  _ViewModel({this.darkTheme, this.onPressed});
}
