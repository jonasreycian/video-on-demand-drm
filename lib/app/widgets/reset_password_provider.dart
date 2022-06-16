import 'package:flutter/foundation.dart';

import '../../device/utils/api_request.dart';

enum ApiResponse { idle, loading, success, fail }

class ResetPasswordProvider with ChangeNotifier {
  ApiResponse _status = ApiResponse.idle;
  String? _message;
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  bool _passwordError = false;
  bool _confirmPasswordError = false;

  //getter
  ApiResponse get status => _status;
  String? get message => _message;
  bool get isPasswordObscure => _isPasswordObscure;
  bool get isConfirmPasswordObscure => _isConfirmPasswordObscure;

  bool get passwordError => _passwordError;
  bool get confirmPassword => _confirmPasswordError;

  //setter
  setStatus(ApiResponse value) {
    _status = value;
    notifyListeners();
  }

  setPasswordObscure() {
    _isPasswordObscure = !_isPasswordObscure;
    notifyListeners();
  }

  setConfirmPasswordObscure() {
    _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
    notifyListeners();
  }

  onSubmit(String email, String password, String confirmPassword) {
    fieldsValidations(password, confirmPassword);
    setStatus(ApiResponse.loading);

    Map<String, dynamic> body = {
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };
    if ((password.length >= 8 && confirmPassword.length >= 8) &
        (password == confirmPassword)) {
      API()
          .request(
              requestType: RequestType.post,
              parameter: body,
              endPoint: '/reset-password')
          .then((value) {
        if (value['success']) {
          _message = value['message'];
          _status = ApiResponse.success;
          notifyListeners();
        } else {
          _message = value['message'];
          _status = ApiResponse.fail;
          notifyListeners();
        }
      });
    }
    Future.delayed(const Duration(seconds: 3), () {
      reset();
    });
  }

  reset() {
    _status = ApiResponse.idle;
    _message = null;
    _passwordError = false;
    _confirmPasswordError = false;
    notifyListeners();
  }

  fieldsValidations(
    _password,
    _confirmPassword,
  ) {
    if (_password.length < 8) {
      _passwordError = true;
      _message = 'Password must be 8 characters above';
    }
    if (_confirmPassword.length < 8) {
      _confirmPasswordError = true;
      _message = 'Password must be 8 characters above';
    }
    if (_password != _confirmPassword) {
      _passwordError = true;
      _confirmPasswordError = true;
      _message = 'Password not matched';
    }
  }
}
