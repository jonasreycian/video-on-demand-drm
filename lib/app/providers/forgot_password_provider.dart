import 'package:aq_prime/device/utils/api_request.dart';
import 'package:flutter/foundation.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = true;

  final List<String> _choices = ['Reset via Mobile Number', 'Reset via Email'];
  String? _message;
  //getter
  String? get message => _message;
  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  List<String> get choices => [..._choices];
  //setter

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
    _isLoading = true;
    notifyListeners();
    _message = null;
  }
}
