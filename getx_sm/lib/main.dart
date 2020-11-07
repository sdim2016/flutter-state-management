import 'package:flutter/material.dart';
import 'package:getxsm/controller/news_controller.dart';
import 'package:getxsm/controller/notes_controller.dart';
import 'package:getxsm/controller/settings_controller.dart';
import 'package:getxsm/view/main_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());
  final NewsController newsController = Get.put(NewsController());
  final NotesController notesController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>
         GetMaterialApp(
          title: 'Flutter State Management',
          theme: settingsController.darkTheme.value
              ? ThemeData.dark()
              : ThemeData.light(),
          home: MainScreen(title: 'Flutter State Management'),
        )
    );
  }
}
