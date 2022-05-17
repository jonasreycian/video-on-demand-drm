// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/foundation.dart';

class ChangePasswordMyAccount with ChangeNotifier {
  String _password = '';
  final numericRegex = RegExp(r'[0-9]');
  final upperCaseRegex = RegExp(r'[A-Z]');
  final lowerCaseRegex = RegExp(r'[a-z]');
  bool _passwordHidden = true;
  bool _passwordConfirmHidden = false;

  bool _eightChar = false;
  bool _oneNumber = false;
  bool _oneLower = false;
  bool _oneUpper = false;
  bool _passwordIsMatch = false;
  bool _allSuccess = false;

  bool get passwordHidden => _passwordHidden;
  bool get passwordConfirmHidden => _passwordConfirmHidden;

  bool get eightChar => _eightChar;
  bool get oneNumber => _oneNumber;
  bool get oneLower => _oneLower;
  bool get oneUpper => _oneUpper;
  bool get allSuccess => _allSuccess;
  bool get isPasswordMatch => _passwordIsMatch;

  setPassword(value) {
    isEightChar(value);
    oneNumberValidation(value);
    oneLowerCaseValidation(value);
    oneUpperCaseValidation(value);
    isSuccessAll();
    notifyListeners();
    _password = value;
  }

  setConfirmPassword(value) {
    isPasswordMatchValidation(value);
    notifyListeners();
  }

  setPasswordHidden() {
    _passwordHidden = !_passwordHidden;
    notifyListeners();
  }

  setPasswordConfirmHidden() {
    _passwordConfirmHidden = !_passwordConfirmHidden;
    notifyListeners();
  }

  ///VALIDATIONSSS------------------------------------------------------------------------------------
  isEightChar(value) {
    if (value.length >= 8) {
      _eightChar = true;
    } else {
      _eightChar = false;
    }
  }

  oneNumberValidation(value) {
    if (numericRegex.hasMatch(value)) {
      _oneNumber = true;
      _passwordIsMatch = false;
    } else {
      _oneNumber = false;
      _passwordIsMatch = false;
    }
  }

  oneLowerCaseValidation(value) {
    if (lowerCaseRegex.hasMatch(value)) {
      _oneLower = true;
      _passwordIsMatch = false;
    } else {
      _oneLower = false;
      _passwordIsMatch = false;
    }
  }

  oneUpperCaseValidation(value) {
    if (upperCaseRegex.hasMatch(value)) {
      _oneUpper = true;
      _passwordIsMatch = false;
    } else {
      _oneUpper = false;
      _passwordIsMatch = false;
    }
  }

  isSuccessAll() {
    if (_eightChar && _oneNumber && _oneLower && _oneUpper) {
      _allSuccess = true;
    } else {
      _allSuccess = false;
    }
  }

  isPasswordMatchValidation(value) {
    if (_password == value) {
      _passwordIsMatch = true;
    } else {
      _passwordIsMatch = false;
    }
  }
}
