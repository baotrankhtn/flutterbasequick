import 'package:flutter/material.dart';
import '/data/local/pref_repository.dart';
import '../base_bloc.dart';
import '/bloc/base/locale/locale_state.dart';

class LocaleBloc extends BaseBloc<LocaleState> {
  PrefRepository _prefRepository;

  LocaleBloc(this._prefRepository) : super(LocaleState(const Locale("en"))) {
    _initLocale();
  }

  void changeLocale(Locale locale) async {
    await _prefRepository.setAppLanguage(locale);
    emit(LocaleState(locale));
  }

  void getLocale() async {
    var currentLocale = _prefRepository.getAppLanguage();
    if (currentLocale != null) {
      emit(LocaleState(currentLocale));
    }
  }

  void _initLocale() async {
    var currentLocale = _prefRepository.getAppLanguage();
    if (currentLocale == null) {
      currentLocale = const Locale('en');
      await _prefRepository.setAppLanguage(currentLocale);
    }
    emit(LocaleState(currentLocale));
  }
}
