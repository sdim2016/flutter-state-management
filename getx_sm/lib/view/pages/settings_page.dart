import 'package:flutter/material.dart';
import 'package:getxsm/controller/settings_controller.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
          () => SettingsList(
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
                      Get.find<SettingsController>().setSettings(value);
                    },
                    switchValue: Get.find<SettingsController>().darkTheme.value
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
