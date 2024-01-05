import 'dart:ui';

Locale getLocale(int? index) {
  if (index == 1) {
    return const Locale.fromSubtags(
        languageCode: 'tr', countryCode: 'TR', scriptCode: 'Türkçe');
  } else {
    return const Locale.fromSubtags(
        languageCode: 'en', countryCode: 'US', scriptCode: 'English');
  }
}
