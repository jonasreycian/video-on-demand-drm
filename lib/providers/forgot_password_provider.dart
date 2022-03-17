import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool _isSuccessOtp = false;
  bool _isSuccess = false;
  bool _isLoading = true;
  CountryCode _countryCode = CountryCode(code: 'PH', dialCode: '+63', flagUri: 'flags/ph.png', name: 'Pilipinas');
  String _hintText = 'Email';
  TextInputType _textInputType = TextInputType.text;
  String _selectedWidgetCard = 'Reset via Email';
  List<String> _choices = ['Reset via Mobile Number', 'Reset via Email'];
  String _message = 'Please Wait...';
  //getter
  String get hintText => _hintText;
  CountryCode get countryCode => _countryCode;
  TextInputType get textInputType => _textInputType;
  String get message => _message;
  bool get isSuccess => _isSuccess;
  bool get isSuccessOtp => _isSuccessOtp;
  bool get isLoading => _isLoading;
  String get selectedWidgetCard => _selectedWidgetCard;
  List<String> get choices => [..._choices];
  //setter
  setCountryCode(value) {
    _countryCode = value;
    notifyListeners();
  }

  setStateHAHA() {
    notifyListeners();
  }

  setSelectedWidgetCard(value) {
    _selectedWidgetCard = value;
    if (_selectedWidgetCard == _choices[0]) {
      _hintText = 'Mobile number';
      _textInputType = TextInputType.number;
    }
    if (_selectedWidgetCard == _choices[1]) {
      _hintText = 'Email';
      _textInputType = TextInputType.text;
    }
    notifyListeners();
  }

  sendAPI(value) {
    reset();
    Future.delayed(const Duration(milliseconds: 2000), () {
      _isSuccess = true;
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) || value.length >= 8) {
        if (_hintText == 'Mobile number') _message = 'Please check your SMS inbox';
        if (_hintText == 'Email') _message = 'Please check your Email';
        _isSuccess = true;
        _isLoading = false;
        notifyListeners();
      }
      if (_hintText == 'Email' && !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
        _message = 'Invalid Email Address';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
      if (_hintText == 'Mobile number' && value.length < 8) {
        _message = 'Phone Number must be\n8 characters above';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
    });
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
    // _hintText = 'Email';
    // _textInputType = TextInputType.text;
    // _selectedWidgetCard = 'Reset via Email';
    _message = 'Please Wait...';
  }
}
