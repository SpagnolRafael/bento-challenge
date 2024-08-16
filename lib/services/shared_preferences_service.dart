import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  get({required String key, required Type type});
  Future post({required String key, required dynamic data});
  Future remove({required String key});
  bool watchedTutorial(String key);
  setWatchedTutorial({required String key, required bool watched});
}

class Preferences implements Storage {
  final SharedPreferences prefs;
  Preferences(this.prefs);

  @override
  get({required String key, required Type type}) {
    if (type == String) {
      return prefs.getString(key);
    } else if (type == int) {
      return prefs.getInt(key);
    } else if (type == double) {
      return prefs.getDouble(key);
    } else if (type == bool) {
      return prefs.getBool(key);
    } else if (type == List<String>) {
      return prefs.getStringList(key);
    } else {
      return prefs.get(key);
    }
  }

  @override
  Future post({required String key, required data}) async {
    if (data is String) {
      await prefs.setString(key, data);
    } else if (data is int) {
      await prefs.setInt(key, data);
    } else if (data is double) {
      await prefs.setDouble(key, data);
    } else if (data is bool) {
      await prefs.setBool(key, data);
    } else if (data is List<String>) {
      await prefs.setStringList(key, data);
    }
  }

  @override
  Future remove({required String key}) async {
    return await prefs.remove(key);
  }

  @override
  bool watchedTutorial(String key) {
    final watched = prefs.getBool(key);
    return watched ?? false;
  }

  @override
  void setWatchedTutorial({required String key, required bool watched}) {
    prefs.setBool(key, watched);
  }
}
