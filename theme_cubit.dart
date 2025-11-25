import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String key = "theme_mode";

  ThemeCubit() : super(ThemeMode.system) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(key);

    switch (saved) {
      case "light":
        emit(ThemeMode.light);
        break;
      case "dark":
        emit(ThemeMode.dark);
        break;
      default:
        emit(ThemeMode.system);
    }
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
      prefs.setString(key, "dark");
    } else {
      emit(ThemeMode.light);
      prefs.setString(key, "light");
    }
  }
}
