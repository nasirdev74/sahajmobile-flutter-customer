import 'package:flutter/material.dart';

class NumberLocalizations {
  static const _englishToBengaliDigits = {
    '0': '০',
    '1': '১',
    '2': '২',
    '3': '৩',
    '4': '৪',
    '5': '৫',
    '6': '৬',
    '7': '৭',
    '8': '৮',
    '9': '৯',
  };

  /// Converts digits in the input string to the appropriate numeral system based on the locale.
  /// For Bengali ('bn'), converts 0-9 to ০-৯. For other locales, returns the input unchanged.
  static String toLocale(String input, Locale locale) {
    if (input.isEmpty || locale.languageCode != 'bn') {
      return input;
    }
    return input.replaceAllMapped(
      RegExp(r'[0-9]'),
      (Match match) => _englishToBengaliDigits[match[0]] ?? match[0]!,
    );
  }
}

extension NumberLocalizationExtension on String {
  /// Localizes the string as a number (e.g., converts digits to Bengali for 'bn' locale).
  String toLocalizedNumber(BuildContext context) {
    return NumberLocalizations.toLocale(this, Localizations.localeOf(context));
  }
}
