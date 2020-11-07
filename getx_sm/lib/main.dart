import 'package:flutter/material.dart';
import 'package:getxsm/controller/settings_controller.dart';
import 'package:getxsm/view/main_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<SettingsController>(
      init: SettingsController(),
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
