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

  /// `No Permission`
  String get noPermission {
    return Intl.message(
      'No Permission',
      name: 'noPermission',
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

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
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

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get requiredEmail {
    return Intl.message(
      'Email is required',
      name: 'requiredEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email is invalid format`
  String get invalidEmail {
    return Intl.message(
      'Email is invalid format',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get requiredPassword {
    return Intl.message(
      'Password is required',
      name: 'requiredPassword',
      desc: '',
      args: [],
    );
  }

  /// `The password must be at least 8 characters.`
  String get invalidPassword {
    return Intl.message(
      'The password must be at least 8 characters.',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Network Error`
  String get networkErrorMessage {
    return Intl.message(
      'Network Error',
      name: 'networkErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Some thing went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Some thing went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Invalid format`
  String get invalidFormat {
    return Intl.message(
      'Invalid format',
      name: 'invalidFormat',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
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

  /// `No Items`
  String get noItems {
    return Intl.message(
      'No Items',
      name: 'noItems',
      desc: '',
      args: [],
    );
  }

  /// `Login To`
  String get loginTo {
    return Intl.message(
      'Login To',
      name: 'loginTo',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up To`
  String get signUpTo {
    return Intl.message(
      'Sign Up To',
      name: 'signUpTo',
      desc: '',
      args: [],
    );
  }

  /// `The confirm password is not match`
  String get passwordIsNotMatch {
    return Intl.message(
      'The confirm password is not match',
      name: 'passwordIsNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code is required`
  String get verifyCodeIsRequired {
    return Intl.message(
      'Verify Code is required',
      name: 'verifyCodeIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send Email`
  String get sendEmail {
    return Intl.message(
      'Send Email',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please provide your email address, we will send you instructions to reset your password.`
  String get forgotPassDesc {
    return Intl.message(
      'Please provide your email address, we will send you instructions to reset your password.',
      name: 'forgotPassDesc',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
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

  /// `The new password sent to your email.`
  String get newPasswordSent {
    return Intl.message(
      'The new password sent to your email.',
      name: 'newPasswordSent',
      desc: '',
      args: [],
    );
  }

  /// `View my profile`
  String get viewMyProfile {
    return Intl.message(
      'View my profile',
      name: 'viewMyProfile',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
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

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
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

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Enter Current Password`
  String get enterCurrentPassword {
    return Intl.message(
      'Enter Current Password',
      name: 'enterCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enterNewPassword {
    return Intl.message(
      'Enter New Password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New password',
      name: 'confirmNewPassword',
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

  /// `Update Profile Successfully`
  String get updateProfileSuccessfully {
    return Intl.message(
      'Update Profile Successfully',
      name: 'updateProfileSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Full Name is required`
  String get requiredFullName {
    return Intl.message(
      'Full Name is required',
      name: 'requiredFullName',
      desc: '',
      args: [],
    );
  }

  /// `Full Name Invalid`
  String get invalidFullName {
    return Intl.message(
      'Full Name Invalid',
      name: 'invalidFullName',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password Invalid`
  String get confirmPasswordInvalid {
    return Intl.message(
      'Confirm Password Invalid',
      name: 'confirmPasswordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Surah`
  String get surah {
    return Intl.message(
      'Surah',
      name: 'surah',
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

  /// `Juzu`
  String get juzu {
    return Intl.message(
      'Juzu',
      name: 'juzu',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Ayah`
  String get ayah {
    return Intl.message(
      'Ayah',
      name: 'ayah',
      desc: '',
      args: [],
    );
  }

  /// `JuZu`
  String get juZu {
    return Intl.message(
      'JuZu',
      name: 'juZu',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
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
