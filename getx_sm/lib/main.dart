import 'package:flutter/material.dart';
import 'package:getxsm/view/main_screen.dart';
import 'package:getxsm/viewmodel/settings_viewmodel.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<SettingsViewModel>(
      init: SettingsViewModel(),
      builder: (settingsViewModel) {
        return MaterialApp(
        title: 'Flutter State Management',
        theme: settingsViewModel.darkTheme.value ? ThemeData.dark() : ThemeData.light(),
        home: MainScreen(title: 'Flutter State Management'),
      );
      }
    );
  }
}
