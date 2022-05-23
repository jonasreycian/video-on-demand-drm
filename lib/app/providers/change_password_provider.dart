import 'package:aq_prime/device/utils/api_request.dart';
import 'package:flutter/foundation.dart';

class ChangePasswordMyAccount with ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = true;
  String? _message;
  // String _currentPassword = '';
  String _newPassword = '';
  final RegExp numericRegex = RegExp(r'[0-9]');
  final RegExp upperCaseRegex = RegExp(r'[A-Z]');
  final RegExp lowerCaseRegex = RegExp(r'[a-z]');
  bool _currentPasswordHidden = true;
  bool _passwordHidden = true;
  bool _passwordConfirmHidden = true;

  bool _eightChar = false;
  bool _oneNumber = false;
  bool _oneLower = false;
  bool _oneUpper = false;
  bool _passwordIsMatch = false;
  bool _isCurrentPasswordFilled = false;
  bool _allSuccess = false;

  bool get currentPasswordHideen => _currentPasswordHidden;
  bool get passwordHidden => _passwordHidden;
  bool get passwordConfirmHidden => _passwordConfirmHidden;

  bool get eightChar => _eightChar;
  bool get oneNumber => _oneNumber;
  bool get oneLower => _oneLower;
  bool get oneUpper => _oneUpper;
  bool get allSuccess => _allSuccess;
  bool get isPasswordMatch => _passwordIsMatch;

  String? get message => _message;
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  bool get isCurrentPasswordFilled => _isCurrentPasswordFilled;
  setCurrentPassword(value) {
    checkCurrentPasswordLength(value);
    notifyListeners();
  }

  setPassword(value) {
    isEightChar(value);
    oneNumberValidation(value);
    oneLowerCaseValidation(value);
    oneUpperCaseValidation(value);
    isSuccessAll();
    notifyListeners();
    _newPassword = value;
  }

  setConfirmPassword(value) {
    isPasswordMatchValidation(value);
    notifyListeners();
  }

  setCurrentPasswordHidden() {
    _currentPasswordHidden = !_currentPasswordHidden;
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

  resetPassword(
      String currentPassword, String newPassword, String confirmNewPassword) {
    _message = null;
    _isSuccess = false;
    _isLoading = true;
    Map<String, String> body = {
      'current_password': currentPassword,
      'password': newPassword,
      'password_confirmation': confirmNewPassword
    };
    API()
        .request(
            requestType: RequestType.put,
            parameter: body,
            endPoint: '/users/password/change')
        .then((value) {
      if (value['success']) {
        _isSuccess = true;
        _isLoading = false;
        _message = value['message'];
        notifyListeners();
      } else {
        _isSuccess = false;
        _isLoading = false;
        _message = 'Incorrect Current password';
        notifyListeners();
      }
    });
  }

  reset() {
    _message = null;
    _isSuccess = false;
    _isLoading = true;

    _eightChar = false;
    _oneNumber = false;
    _oneLower = false;
    _oneUpper = false;
    _passwordIsMatch = false;
    _allSuccess = false;
    _isCurrentPasswordFilled = false;

    _currentPasswordHidden = true;
    _passwordHidden = true;
    _passwordConfirmHidden = true;
    notifyListeners();
  }

  ///START VALIDATIONSSS------------------------------------------------------------------------------------
  checkCurrentPasswordLength(String value) {
    if (value.length >= 8) {
      _isCurrentPasswordFilled = true;
    } else {
      _isCurrentPasswordFilled = false;
    }
  }

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
    if (_newPassword == value) {
      _passwordIsMatch = true;
    } else {
      _passwordIsMatch = false;
    }
  }

  ///END VALIDATIONSSS------------------------------------------------------------------------------------
}
