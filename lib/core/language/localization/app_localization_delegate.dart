import 'package:date_app_team/core/language/localization/app_localization.dart';
import 'package:flutter/material.dart' show Locale, LocalizationsDelegate;

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['vi','en','ko', 'ja'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
