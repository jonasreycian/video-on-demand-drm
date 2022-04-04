import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class RegistrationProvider with ChangeNotifier {
  CountryCode _countryCode = CountryCode(code: 'PH', dialCode: '+63', flagUri: 'flags/ph.png', name: 'Pilipinas');
  DateTime? _birthDay;
  String _message = 'Please Wait...';
  bool _isSuccess = false;
  bool _isLoading = true;
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _mobileNumber = '';
  String _password = '';
  String _confirmPassword = '';
  //getter
  String getField(name) {
    if (name == 'firstName') {
      return _firstName;
    }
    if (name == 'lastName') {
      return _lastName;
    }
    if (name == 'email') {
      return _email;
    }
    if (name == 'mobileNumber') {
      return _mobileNumber;
    }
    if (name == 'password') {
      return _password;
    }
    if (name == 'confirmPassword') {
      return _confirmPassword;
    } else
      // ignore: curly_braces_in_flow_control_structures
      return '';
  }

  CountryCode get countryCode => _countryCode;
  String get message => _message;
  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  bool get isObscurePassword => _isObscurePassword;
  bool get isObscureConfirmPassword => _isObscureConfirmPassword;
  String? get birthDayString => _birthDay != null ? DateFormat.yMMMMd().format(_birthDay!) : null;

  //setter
  setField(String field, String value) {
    if (field == 'firstName') _firstName = value;
    if (field == 'lastName') _lastName = value;
    if (field == 'email') _email = value;
    if (field == 'mobileNumber') _mobileNumber = value;
    if (field == 'password') _password = value;
    if (field == 'confirmPassword') _confirmPassword = value;
  }

  setBirthDay(DateTime? value) {
    _birthDay = value;
    notifyListeners();
  }

  setCountryCode(value) {
    _countryCode = value;
    notifyListeners();
  }

  setIsObscurePassword() {
    _isObscurePassword = !_isObscurePassword;
    notifyListeners();
  }

  setIsObscureConfirmPassword() {
    _isObscureConfirmPassword = !_isObscureConfirmPassword;
    notifyListeners();
  }

  sendAPI(firstName, lastName, email, mobileNumber, password, confirmPassword) {
    reset();
    Future.delayed(const Duration(milliseconds: 2000), () {
      _isSuccess = true;
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email) &&
          password.length >= 8 &&
          password == confirmPassword) {
        _message = 'Please check your SMS inbox';
        _isSuccess = true;
        _isLoading = false;
        notifyListeners();
      }

      if (password.length < 8) {
        _message = 'Password must be\n8 characters above';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
      if (password != confirmPassword) {
        _message = 'Password not match';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
        _message = 'Invalid Email address';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  sendOTP(value) {
    print(value);
  }

  reset() {
    _message = 'Please Wait...';
    _isLoading = true;
    _isObscurePassword = true;
    _isObscureConfirmPassword = true;
  }
}
