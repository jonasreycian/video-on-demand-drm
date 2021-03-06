import 'package:flutter/foundation.dart';

import '../../data/utils/utils.dart';
import '../../device/utils/api_request.dart';
import '../../device/utils/user_data.dart' as user_data;

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

  hasContainingTexts() {}

  sendAPI(email, password) async {
    _isLoading = true;
    _isSuccess = false;
    _message = null;
    final String device = await Utils.getDeviceName();
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email) &&
        password.length >= 8) {
      Map<String, String> body = {
        'email': email,
        'password': password,
        'device_name': device
      };
      API()
          .request(
              requestType: RequestType.post,
              parameter: body,
              endPoint: '/login')
          .then((value) {
        if (value['success']) {
          _isSuccess = true;
          _isLoading = false;
          _message = 'Logging in...';
          user_data.saveLoggedIn(value['data']);
          notifyListeners();
        } else {
          _isSuccess = false;
          _isLoading = false;
          _message = value['errors']['email'][0];
          notifyListeners();
        }
      });
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
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
