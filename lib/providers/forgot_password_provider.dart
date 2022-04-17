import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:aq_prime/utilities/api_request.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool _isObscure = true;
  bool _isObscureConfirm = true;

  bool _isSuccessOtp = false;
  bool _isSuccess = false;
  bool _isLoading = true;
  String? _password;
  String? _confirmPassword;

  String _hintText = 'Email';
  String _submitName = 'Mail OTP';
  CountryCode _countryCode = CountryCode(code: 'PH', dialCode: '+63', flagUri: 'flags/ph.png', name: 'Pilipinas');
  String? _email;
  TextInputType _textInputType = TextInputType.text;
  String _selectedWidgetCard = 'Reset via Email';
  final List<String> _choices = ['Reset via Mobile Number', 'Reset via Email'];
  String? _message;
  //getter
  bool get isObscure => _isObscure;
  bool get isObscureConfirm => _isObscureConfirm;
  String get hintText => _hintText;
  String get submitName => _submitName;
  String? get email => _email;
  CountryCode get countryCode => _countryCode;
  TextInputType get textInputType => _textInputType;
  String? get message => _message;
  bool get isSuccess => _isSuccess;
  bool get isSuccessOtp => _isSuccessOtp;
  bool get isLoading => _isLoading;
  String get selectedWidgetCard => _selectedWidgetCard;
  List<String> get choices => [..._choices];
  String? get password => _password;
  String? get confirmPassword => _confirmPassword;
  //setter
  setIsObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  setIsObscureConfirm(bool value) {
    _isObscureConfirm = value;
    notifyListeners();
  }

  setEmail(value) => _email = value;
  setPassword(String value) => _password = value;
  setConfirmPassword(String value) => _confirmPassword = value;

  setCountryCode(CountryCode value) {
    _countryCode = value;
    notifyListeners();
  }

  setSelectedWidgetCard(value) {
    _selectedWidgetCard = value;
    if (_selectedWidgetCard == _choices[0]) {
      _hintText = 'Mobile number';
      _submitName = 'SMS OTP';
      _textInputType = TextInputType.number;
    }
    if (_selectedWidgetCard == _choices[1]) {
      _hintText = 'Email';
      _submitName = 'Mail OTP';
      _textInputType = TextInputType.text;
    }
    notifyListeners();
  }

  sendEmailOrNumber() {
    reset();
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email!) && (_password != null && _password!.length < 8) && (_confirmPassword != null && _confirmPassword!.length < 8)) {
      Map<String, dynamic> body = {'email': _email, 'password': _password, 'password_confirmation': _confirmPassword};
      API().request(parameter: body, endPoint: '/v1/reset-password').then((value) {
        if (value['exception'] == null) {
          if (_email == 'Mobile number') _message = 'Please check your SMS inbox';
          if (_email == 'Email') _message = 'Please check your Email';
          _isSuccess = true;
          _isLoading = false;
          notifyListeners();
        }
      });
    }
    if (_email == 'Email' && !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email!)) {
      _message = 'Invalid Email Address';
      _isSuccess = false;
      _isLoading = false;
      notifyListeners();
    }
    if (_password!.length < 8 && _confirmPassword!.length < 8) {
      _message = 'Password must be\n8 characters above';
      _isSuccess = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  sendOTP(otpValue) {
    _isSuccess = true;
    _isSuccessOtp = true;
    notifyListeners();
  }

  reset() {
    _isSuccess = false;
    _isSuccessOtp = false;
    _isLoading = true;
    // _countryCode = CountryCode(code: 'PH', dialCode: '+63', flagUri: 'flags/ph.png', name: 'Pilipinas');
    // _email = 'Email';
    // _textInputType = TextInputType.text;
    // _selectedWidgetCard = 'Reset via Email';
    _message = null;
  }
}
