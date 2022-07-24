// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Authorization`
  String get auth {
    return Intl.message(
      'Authorization',
      name: 'auth',
      desc: '',
      args: [],
    );
  }

  /// `Input login and password`
  String get inputLoginAndPassword {
    return Intl.message(
      'Input login and password',
      name: 'inputLoginAndPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Wrong login`
  String get inputErrorCheckLogin {
    return Intl.message(
      'Wrong login',
      name: 'inputErrorCheckLogin',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get inputErrorCheckPassword {
    return Intl.message(
      'Wrong password',
      name: 'inputErrorCheckPassword',
      desc: '',
      args: [],
    );
  }

  /// `Wrong login or password is entered`
  String get inputErrorCheckLoginPassword {
    return Intl.message(
      'Wrong login or password is entered',
      name: 'inputErrorCheckLoginPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login must contain at least 3 characters`
  String get lengthErrorCheckLogin {
    return Intl.message(
      'Login must contain at least 3 characters',
      name: 'lengthErrorCheckLogin',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 8 characters`
  String get lengthErrorCheckPassword {
    return Intl.message(
      'Password must contain at least 8 characters',
      name: 'lengthErrorCheckPassword',
      desc: '',
      args: [],
    );
  }

  /// `Main screen`
  String get mainScreen {
    return Intl.message(
      'Main screen',
      name: 'mainScreen',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOut {
    return Intl.message(
      'Sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkMode {
    return Intl.message(
      'Dark Theme',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get lightMode {
    return Intl.message(
      'Light Theme',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russian {
    return Intl.message(
      'Russian',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `Ascending`
  String get asc {
    return Intl.message(
      'Ascending',
      name: 'asc',
      desc: '',
      args: [],
    );
  }

  /// `Descending`
  String get desc {
    return Intl.message(
      'Descending',
      name: 'desc',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Products were not found`
  String get productsListIsEmpty {
    return Intl.message(
      'Products were not found',
      name: 'productsListIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Electronics`
  String get electronics {
    return Intl.message(
      'Electronics',
      name: 'electronics',
      desc: '',
      args: [],
    );
  }

  /// `Jewelery`
  String get jewelery {
    return Intl.message(
      'Jewelery',
      name: 'jewelery',
      desc: '',
      args: [],
    );
  }

  /// `Men's clothing`
  String get mensclothing {
    return Intl.message(
      'Men\'s clothing',
      name: 'mensclothing',
      desc: '',
      args: [],
    );
  }

  /// `Women's clothing`
  String get womensclothing {
    return Intl.message(
      'Women\'s clothing',
      name: 'womensclothing',
      desc: '',
      args: [],
    );
  }

  /// `Rating: all`
  String get rating_all {
    return Intl.message(
      'Rating: all',
      name: 'rating_all',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 2`
  String get rating_2 {
    return Intl.message(
      'Rating: 2',
      name: 'rating_2',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 3`
  String get rating_3 {
    return Intl.message(
      'Rating: 3',
      name: 'rating_3',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 4`
  String get rating_4 {
    return Intl.message(
      'Rating: 4',
      name: 'rating_4',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 5`
  String get rating_5 {
    return Intl.message(
      'Rating: 5',
      name: 'rating_5',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong :-(`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong :-(',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
