import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokerface/presentation/app/booters/booter.dart';

class ThemeBooter extends Booter<void> {
  static final ThemeBooter instance = ThemeBooter();

  @override
  Future<void> bootUp() async {
    log('⚠️ThemeBooter: booting');
    // This is required in order to make the status bar and app color same in Android.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    log('⚠️ThemeBooter: booted');
  }

  @override
  void bootDown() {
    log('⚠️ThemeBooter: bootDown');
  }
}
