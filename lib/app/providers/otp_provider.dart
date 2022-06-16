import 'package:flutter/foundation.dart';

import '../../device/utils/api_request.dart';

class OtpProvider with ChangeNotifier {
  bool _isError = false;
  bool _isPinComplete = false;
  bool _isLoading = false;
  bool _isSuccess = false;
  String _pin = '';

  String? _message;

  bool get isError => _isError;
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  bool get isPinComplete => _isPinComplete;
  String get pin => _pin;
  String? get message => _message;
  onChange(String value) {
    _pin = value;
    if (value.length >= 4) {
      _isPinComplete = true;
      notifyListeners();
    } else {
      _isPinComplete = false;
    }
  }

  onSubmit(String value, String pin) {
    _isLoading = true;
    Map<String, dynamic> body = {
      'value': value,
      'token': pin,
    };
    API()
        .request(
            requestType: RequestType.post,
            parameter: body,
            endPoint: '/verify-otp')
        .then((value) {
      if (value['success']) {
        _message = value['message'];
        _isLoading = false;
        _isSuccess = true;
        notifyListeners();
      } else {
        _isLoading = false;
        _isError = true;
        _message = value['message'];
        notifyListeners();
      }
    });
    notifyListeners();
    Future.delayed(const Duration(seconds: 3), () {
      reset();
    });
  }

  reset() {
    _isSuccess = false;
    _isError = true;
    _pin = '';
    _isLoading = false;
    _isPinComplete = false;
    _isError = false;
    _message = null;
    notifyListeners();
  }
}
