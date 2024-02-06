import 'dart:developer';

import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/booters/booter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsBooter extends Booter<void> {
  static final PrefsBooter instance = PrefsBooter();

  @override
  Future<void> bootUp() async {
    log('⚠️PrefsBooter: booting');
    final prefs = await SharedPreferences.getInstance();
    MyAppX.prefs.setPrefsInstance(prefs);
    log('⚠️PrefsBooter: booted');
  }

  @override
  void bootDown() {
    log('⚠️PrefsBooter: bootDown');
  }
}
