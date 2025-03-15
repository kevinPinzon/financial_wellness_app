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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Financial Wellness`
  String get appTitle {
    return Intl.message(
      'Financial Wellness',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the app!`
  String get greeting {
    return Intl.message(
      'Welcome to the app!',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  /// `Annual Income`
  String get annualIncomeLabel {
    return Intl.message(
      'Annual Income',
      name: 'annualIncomeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Costs`
  String get monthlyCostsLabel {
    return Intl.message(
      'Monthly Costs',
      name: 'monthlyCostsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid values`
  String get invalidValuesMessage {
    return Intl.message(
      'Please enter valid values',
      name: 'invalidValuesMessage',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButtonLabel {
    return Intl.message(
      'Continue',
      name: 'continueButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Financial Wellness Result`
  String get resultPageTitle {
    return Intl.message(
      'Financial Wellness Result',
      name: 'resultPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your financial wellness score is:`
  String get scoreMessage {
    return Intl.message(
      'Your financial wellness score is:',
      name: 'scoreMessage',
      desc: '',
      args: [],
    );
  }

  /// `Let's find out your financial\n`
  String get financialTitlePart1 {
    return Intl.message(
      'Let\'s find out your financial\n',
      name: 'financialTitlePart1',
      desc: '',
      args: [],
    );
  }

  /// `wellness score.`
  String get financialTitlePart2 {
    return Intl.message(
      'wellness score.',
      name: 'financialTitlePart2',
      desc: '',
      args: [],
    );
  }

  /// `Financial wellness test`
  String get financialSubTitle {
    return Intl.message(
      'Financial wellness test',
      name: 'financialSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `\nEnter your financial information below`
  String get financialDescription {
    return Intl.message(
      '\nEnter your financial information below',
      name: 'financialDescription',
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
      Locale.fromSubtags(languageCode: 'es'),
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
