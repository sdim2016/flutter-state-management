import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxsm/mobx/settings_view_model.dart';
import 'package:mobxsm/view/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SettingsViewModel>(create: (context) {
          final SettingsViewModel settingsViewModel = SettingsViewModel();
          settingsViewModel.getSettings();
          return settingsViewModel;
        })
      ],
      child: Observer(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter State Management',
            theme: Provider.of<SettingsViewModel>(context).darkTheme ? ThemeData.dark() : ThemeData.light(),
            home: MainScreen(title: 'Flutter State Management'),
          );
        }
      ),
    );
  }
}
