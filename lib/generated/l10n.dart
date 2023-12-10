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

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Market`
  String get market {
    return Intl.message(
      'Market',
      name: 'market',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back, we missed You!`
  String get welcomeBack {
    return Intl.message(
      'Welcome back, we missed You!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Not a member?`
  String get notAMember {
    return Intl.message(
      'Not a member?',
      name: 'notAMember',
      desc: '',
      args: [],
    );
  }

  /// ` Register now`
  String get registerNow {
    return Intl.message(
      ' Register now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, let\'s get started!`
  String get welcomeLetsGo {
    return Intl.message(
      'Welcome, let\\\'s get started!',
      name: 'welcomeLetsGo',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
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

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// ` Log In`
  String get logIn {
    return Intl.message(
      ' Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
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

  /// `Stories`
  String get stories {
    return Intl.message(
      'Stories',
      name: 'stories',
      desc: '',
      args: [],
    );
  }

  /// `QR`
  String get qr {
    return Intl.message(
      'QR',
      name: 'qr',
      desc: '',
      args: [],
    );
  }

  /// `Name: {name}`
  String nameName(Object name) {
    return Intl.message(
      'Name: $name',
      name: 'nameName',
      desc: '',
      args: [name],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Email: {email}`
  String emailEmail(Object email) {
    return Intl.message(
      'Email: $email',
      name: 'emailEmail',
      desc: '',
      args: [email],
    );
  }

  /// `Long Road`
  String get longRoad {
    return Intl.message(
      'Long Road',
      name: 'longRoad',
      desc: '',
      args: [],
    );
  }

  /// `Urban City`
  String get urbanCity {
    return Intl.message(
      'Urban City',
      name: 'urbanCity',
      desc: '',
      args: [],
    );
  }

  /// `QR Scanner`
  String get qrScanner {
    return Intl.message(
      'QR Scanner',
      name: 'qrScanner',
      desc: '',
      args: [],
    );
  }

  /// `Scan a code`
  String get scanACode {
    return Intl.message(
      'Scan a code',
      name: 'scanACode',
      desc: '',
      args: [],
    );
  }

  /// `Change the Camera`
  String get changeTheCamera {
    return Intl.message(
      'Change the Camera',
      name: 'changeTheCamera',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get loading {
    return Intl.message(
      'loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `resume`
  String get resume {
    return Intl.message(
      'resume',
      name: 'resume',
      desc: '',
      args: [],
    );
  }

  /// `No Permission`
  String get noPermission {
    return Intl.message(
      'No Permission',
      name: 'noPermission',
      desc: '',
      args: [],
    );
  }

  /// `Scan Again`
  String get scanAgain {
    return Intl.message(
      'Scan Again',
      name: 'scanAgain',
      desc: '',
      args: [],
    );
  }

  /// `Data: {result.code}`
  String get dataResultcode {
    return Intl.message(
      'Data: {result.code}',
      name: 'dataResultcode',
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
