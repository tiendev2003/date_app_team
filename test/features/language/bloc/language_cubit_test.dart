import 'package:date_app_team/features/language/bloc/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LanguageCubit', () {
    late LanguageCubit languageCubit;

    setUp(() {
      languageCubit = LanguageCubit();
    });

    tearDown(() {
      languageCubit.close();
    });

    test('initial state is SelectedLanguage(Locale(\'vi\'))', () {
      expect(languageCubit.state, const SelectedLanguage(Locale('vi')));
    });

    test('toVietNamese emits SelectedLanguage(Locale(\'vi\'))', () {
      languageCubit.toVietNamese();
      expect(languageCubit.state, const SelectedLanguage(Locale('vi')));
    });

    test('toEnglish emits SelectedLanguage(Locale(\'en\'))', () {
      languageCubit.toEnglish();
      expect(languageCubit.state, const SelectedLanguage(Locale('en')));
    });

    test('toKorea emits SelectedLanguage(Locale(\'ko\'))', () {
      languageCubit.toKorea();
      expect(languageCubit.state, const SelectedLanguage(Locale('ko')));
    });

    test('toJapan emits SelectedLanguage(Locale(\'ja\'))', () {
      languageCubit.toJapan();
      expect(languageCubit.state, const SelectedLanguage(Locale('ja')));
    });
  });
}