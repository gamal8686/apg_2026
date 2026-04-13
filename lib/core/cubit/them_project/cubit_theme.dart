import 'package:company_apg_2026/core/cubit/them_project/state_theme.dart';
import 'package:company_apg_2026/core/logic/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


enum ThemeModeState { light, dark, system }

class CubitTheme extends Cubit<StateTheme> {
  CubitTheme() : super(StateInit()){
    getThemDataCashHelper();
  }

  ThemeModeState currentTheme = ThemeModeState.system;

  Future<void> selectTheme(ThemeModeState theme) async {
    currentTheme = theme;
    await CashHelper.saveThemeMode(CashHelperKeys.themeMode, currentTheme.name);
    emit(StateChangeTheme());
  }

  static CubitTheme get(context) => BlocProvider.of(context);

  ThemeMode getTheme() {
    switch (currentTheme) {
      case ThemeModeState.light:
        return ThemeMode.light;
      case ThemeModeState.dark:
        return ThemeMode.dark;
      case ThemeModeState.system:
        return ThemeMode.system;
    }
  }

  Future<void> getThemDataCashHelper() async {
    String? saveTheme = await CashHelper.getThemeMode(
      CashHelperKeys.themeMode,
    );
    if (saveTheme != null) {
      currentTheme = ThemeModeState.values.firstWhere(
        (e) => e.name == saveTheme,
        orElse: () => ThemeModeState.system,
      );
      emit(StateChangeTheme());
    }
  }
}
