import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChangeThemeDemo extends StatefulWidget {
  const ChangeThemeDemo({Key? key}) : super(key: key);

  @override
  _ChangeThemeDemoState createState() => _ChangeThemeDemoState();
}

class _ChangeThemeDemoState extends State<ChangeThemeDemo> {
  ChangeTheme changeTheme = Get.put(ChangeTheme());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "My Name is Dishant",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                color: context.theme.primaryColor),
          ),
          Switch(
              value: changeTheme.isDarkMode.value,
              onChanged: (value) {
                if (Get.isDarkMode) {
                  changeTheme.isDarkMode.value = false;
                  Get.changeThemeMode(ThemeMode.light);
                } else {
                  changeTheme.isDarkMode.value = true;
                  Get.changeThemeMode(ThemeMode.dark);
                }
              })
        ],
      ),
    );
  }
}

class ChangeTheme extends GetxController {
  RxBool isDarkMode =
      SchedulerBinding.instance!.window.platformBrightness == Brightness.dark
          ? true.obs
          : false.obs;
}
