import 'package:aq_prime/utilities/api_request.dart';
import 'package:flutter/foundation.dart';
import 'package:device_information/device_information.dart';
import 'package:aq_prime/utilities/user_data.dart' as user_data;

class LoginProvider with ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = true;
  String? _message;
  bool _passwordObscure = true;

  //getter
  String? get message => _message;
  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  bool get passwordObscure => _passwordObscure;

  //setter
  setPasswordObscure() {
    _passwordObscure = !_passwordObscure;
    notifyListeners();
  }

  sendAPI(email, password) async {
    _isLoading = true;
    _isSuccess = false;
    _message = null;
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email) && password.length >= 8) {
      Map<String, dynamic> body = {'email': email, 'password': password, 'device_name': '${await DeviceInformation.deviceManufacturer}:${await DeviceInformation.deviceModel}'};
      API().request(parameter: body, endPoint: '/v1/login').then((value) {
        if (value['success'] != null) {
          _isSuccess = true;
          _isLoading = false;
          _message = 'Logging in...';
          user_data.saveLoggedIn(value['data']);
          notifyListeners();
        } else {
          _isSuccess = false;
          _isLoading = false;
          _message = value['message'];
          notifyListeners();
        }
      });
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      _message = 'Invalid Email Address';
      _isSuccess = false;
      _isLoading = false;
      notifyListeners();
    }
    if (password.length < 8) {
      _message = 'Password must be\n8 characters above';
      _isSuccess = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  reset() {
    // _isSuccess = false;
    _isLoading = true;
    // _message = null;
    _passwordObscure = true;
  }
}
