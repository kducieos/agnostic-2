import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  static const _keyPrefix = 'level_completed_';

  static Future<void> setLevelCompleted(int level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('$_keyPrefix$level', true);
  }

  static Future<bool> isLevelCompleted(int level) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('$_keyPrefix$level') ?? false;
  }

  static Future<List<bool>> loadLevels(int maxLevel) async {
    final prefs = await SharedPreferences.getInstance();
    return List<bool>.generate(
      maxLevel,
      (i) => prefs.getBool('$_keyPrefix${i + 1}') ?? false,
    );
  }
}
