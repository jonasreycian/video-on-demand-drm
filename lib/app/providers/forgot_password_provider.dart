import 'package:flutter/foundation.dart';

import '../../device/utils/api_request.dart';

enum CurrentView { emailInput, otpInput, newPasswordInput }

class ForgotPasswordProvider with ChangeNotifier {
  CurrentView _view = CurrentView.emailInput;

  bool _successValidation = false;
  bool _isEmailMobileError = false;
  bool _isSuccess = false;
  bool _isLoading = true;
  String _successEmailMobile = '';
  String? _message;
  //getter
  String? get message => _message;
  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  bool get isEmailMobileError => _isEmailMobileError;
  bool get isSuccessValidation => _successValidation;
  String get successEmailMobile => _successEmailMobile;
  CurrentView get view => _view;
  //setter
  setOtpView(CurrentView value) {
    _view = value;
    notifyListeners();
  }

  forgotPasswordAPI(String _emailorMobile) {
    _isEmailMobileError = false;
    _isSuccess = false;
    _message = null;
    _isLoading = true;
    if (_emailorMobile.isNotEmpty) {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(_emailorMobile) ||
          RegExp(r"^(09|\+639)\d{9}$").hasMatch(_emailorMobile)) {
        _successValidation = true;
        notifyListeners();
        Map<String, dynamic> body = {'value': _emailorMobile};
        API()
            .request(
                requestType: RequestType.post,
                parameter: body,
                endPoint: '/generate-otp')
            .then((value) {
          if (value['success']) {
            _message = value['message'];
            _isSuccess = true;
            _isLoading = false;
            _successValidation = false;
            _successEmailMobile = _emailorMobile;
            _view = CurrentView.otpInput;
            notifyListeners();
          } else {
            _message = value['message'];
            _isSuccess = false;
            _isLoading = false;
            _successValidation = false;
            notifyListeners();
          }
        });
      }
      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(_emailorMobile) &&
          !RegExp(r"^(09|\+639)\d{9}$").hasMatch(_emailorMobile)) {
        _message = 'Invalid Email Address | Mobile Phone';
        _isEmailMobileError = true;
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
    } else {
      _message = 'Please Fill-out all fields';
      _isEmailMobileError = true;
      _isSuccess = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  reset() {
    _successValidation = false;
    _isSuccess = false;
    _isLoading = true;
    _message = null;
    _isEmailMobileError = false;
    notifyListeners();
  }
}
