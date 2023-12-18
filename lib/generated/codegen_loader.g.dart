// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "genre_section": "Подборка по жанру",
  "novel": "Роман",
  "detective": "Детектив",
  "fantasy": "Фентези",
  "profile": "Профиль",
  "check_ticket": "Предъявите билет при получении/сдаче литературы",
  "edit": "Изменить",
  "controller": "Контроллер",
  "logout": "Выйти",
  "error": "Произошла ошибка. Попробуйте еще раз.",
  "check_for_added": "Обратитесь к конролеру для офрмления",
  "story": "Актуальное",
  "reader_ticket": "Читательский билет",
  "login": "Войти",
  "register": "Зарегистрироваться",
  "full_mame": "Ф.И.О.",
  "mail": "Почта",
  "age": "Возраст",
  "pass": "Пароль"
};
static const Map<String,dynamic> en = {
  "genre_section": "Selection by genre",
  "novel": "Novel",
  "detective": "Detective",
  "fantasy": "Fantasy",
  "profile": "Profile",
  "check_ticket": "Show your ticket when picking up/delivering literature",
  "edit": "Change",
  "controller": "Controller",
  "logout": "Logout",
  "error": "An error has occurred. Try again.",
  "check_for_added": "Contact the controller for registration.",
  "story": "Currently",
  "reader_ticket": "Library card",
  "login": "Login",
  "register": "Register",
  "full_mame": "Full name",
  "mail": "Email",
  "age": "Age",
  "pass": "Password"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
