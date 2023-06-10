import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('uk'),
  ];

  static const String english = 'en';
  static const String ukrainian = 'uk';

  static String getFlag(String code) {
    switch (code) {
      case english:
        return '🇺🇸';
      case ukrainian:
        return '🇺🇦';
      default:
        return '🇺🇸';
    }
  }
}
