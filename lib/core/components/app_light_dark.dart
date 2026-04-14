import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cubit/them_project/cubit_theme.dart';
import '../logic/shared_preferences.dart';

class AppLightDark extends StatefulWidget{
  @override
  State<AppLightDark> createState() => _AppLightDarkState();
}

class _AppLightDarkState extends State<AppLightDark> {
  bool isDarkMode=false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isDarkMode = !isDarkMode;
        });
        CubitTheme.get(context).selectTheme(
          isDarkMode ? ThemeModeState.light : ThemeModeState.dark,
        );
        CashHelper.getThemeMode(CashHelperKeys.themeMode);
      },
      icon: isDarkMode ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
    );
  }
}