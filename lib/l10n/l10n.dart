import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('uk'),
  ];

  static const String english = 'en';
  static const String ukrainian = 'uk';

  AppLocalizations? translation(BuildContext context) {
    return AppLocalizations.of(context);
  }

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
