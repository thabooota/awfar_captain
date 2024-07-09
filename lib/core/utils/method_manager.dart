import 'dart:io';
import 'dart:ui';

import '../networking/local/prefs_manager.dart';
import '../networking/local/shared_preferences.dart';

class MethodsManager {
  static Locale getLocate() {
    String? lang = SharedPreferencesManager.getData(key: PrefsManager.lang);
    Locale locale = const Locale("en");

    if (lang == null) {
      locale = Locale(Platform.localeName.split("_")[0]);
    } else {
      locale = Locale(lang);
    }
    return locale;
  }
}
