import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String key = "metrics_json";

  Future<String?> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> saveData(String jsonString) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonString);
  }
}
