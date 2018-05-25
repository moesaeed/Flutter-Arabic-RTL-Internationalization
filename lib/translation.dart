import 'dart:async';

import 'package:flutter/material.dart';

import 'translation_strings.dart';

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}

class SpecifiedLocalizationDelegate
    extends LocalizationsDelegate<Translations> {
  final Locale overriddenLocale;

  const SpecifiedLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<Translations> load(Locale locale) =>
      Translations.load(overriddenLocale);

  @override
  bool shouldReload(SpecifiedLocalizationDelegate old) => true;
}
