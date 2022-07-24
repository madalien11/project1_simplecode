import 'package:hive/hive.dart';

class RepoSettings {
  Box? box;

  Future<void> init() async {
    box = Hive.box('settings');
  }

  void saveLocale(String locale) async {
    if (box == null) return;
    return box!.put('locale', locale);
    // return prefs?.setString('locale', locale);
  }

  String? readLocale() {
    if (box == null) return null;
    return box!.get('locale');
    // return prefs?.getString('locale');
  }

  void saveTheme(bool isDarkMode) async {
    if (box == null) return;
    return box!.put('isDarkMode', isDarkMode);
    // return prefs?.setBool('isDarkMode', isDarkMode);
  }

  bool? readTheme() {
    if (box == null) return null;
    return box!.get('isDarkMode');
  }
}
