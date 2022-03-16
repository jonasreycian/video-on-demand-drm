import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';

class RegistrationProvider with ChangeNotifier {
  CountryCode _countryCode = CountryCode(code: 'PH', dialCode: '+63', flagUri: 'flags/ph.png', name: 'Pilipinas');
  String _message = 'Please Wait...';
  bool _isSuccess = false;
  bool _isLoading = true;
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  //getter
  CountryCode get countryCode => _countryCode;
  String get message => _message;
  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  bool get isObscurePassword => _isObscurePassword;
  bool get isObscureConfirmPassword => _isObscureConfirmPassword;

  //setter

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
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email) && password.length >= 8 && password == confirmPassword) {
        _message = 'Registration Complete\nPlease wait...';
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

  reset() {
    _message = 'Please Wait...';
    // _isSuccess = false;
    _isLoading = true;
    _isObscurePassword = true;
    _isObscureConfirmPassword = true;
  }
}
