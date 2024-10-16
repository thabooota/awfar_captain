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

  static String generateEgyptFlagWithCode() {
    String countryCode = 'eg';

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) =>
            String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return "  $flag +02";
  }

  static String generateCountryFlag({required String countryCode}) {
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) =>
            String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }
}