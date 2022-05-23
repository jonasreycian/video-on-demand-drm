import 'package:aq_prime/device/utils/api_request.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/foundation.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool _isObscure = true;
  bool _isObscureConfirm = true;

  bool _isSuccessOtp = false;
  bool _isSuccess = false;
  bool _isLoading = true;

  CountryCode _countryCode = CountryCode(
      code: 'PH', dialCode: '+63', flagUri: 'flags/ph.png', name: 'Pilipinas');

  final List<String> _choices = ['Reset via Mobile Number', 'Reset via Email'];
  String? _message;
  //getter
  bool get isObscure => _isObscure;
  bool get isObscureConfirm => _isObscureConfirm;
  CountryCode get countryCode => _countryCode;
  String? get message => _message;
  bool get isSuccess => _isSuccess;
  bool get isSuccessOtp => _isSuccessOtp;
  bool get isLoading => _isLoading;
  List<String> get choices => [..._choices];
  //setter
  setIsObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  setIsObscureConfirm() {
    _isObscureConfirm = !_isObscureConfirm;
    notifyListeners();
  }

  setCountryCode(CountryCode value) {
    _countryCode = value;
    notifyListeners();
  }

  sendEmailOrNumber(String _email, String _password, String _confirmPassword) {
    _isSuccess = false;
    _message = null;
    _isLoading = true;
    if (_email.isNotEmpty &&
        _password.isNotEmpty &&
        _confirmPassword.isNotEmpty) {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(_email) &&
          (_password.length >= 8) &&
          (_confirmPassword.length >= 8) &&
          (_password == _confirmPassword)) {
        Map<String, dynamic> body = {
          'email': _email,
          'password': _password,
          'password_confirmation': _confirmPassword
        };
        API()
            .request(
                requestType: RequestType.post,
                parameter: body,
                endPoint: '/reset-password')
            .then((value) {
          if (value['success']) {
            _message = value['message'];
            _isSuccess = false;
            _isLoading = false;
            notifyListeners();
          } else {
            _message = value['message'];
            _isSuccess = false;
            _isLoading = false;
            notifyListeners();
          }
        });
      }
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_email)) {
        _message = 'Invalid Email Address';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
      if (_password.length < 8 || _confirmPassword.length < 8) {
        _message = 'Password must be\n8 characters above';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
      if (_password != _confirmPassword) {
        _message = 'Passwords did not matched';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
    } else {
      _message = 'Please Fill-out all fields';
      _isSuccess = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  reset() {
    _isSuccess = false;
    _isSuccessOtp = false;
    _isLoading = true;
    _isObscure = true;
    _isObscureConfirm = true;
    notifyListeners();
    // _countryCode = CountryCode(code: 'PH', dialCode: '+63', flagUri: 'flags/ph.png', name: 'Pilipinas');
    // _email = 'Email';
    // _textInputType = TextInputType.text;
    // _selectedWidgetCard = 'Reset via Email';
    _message = null;
  }
}
