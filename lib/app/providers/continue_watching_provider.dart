import 'package:aq_prime/device/utils/api_request.dart';
import 'package:flutter/foundation.dart';

class ContinueWatching with ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = true;
  Map _data = {};

  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  Map get data => _data;

  loadData() {
    reset();
    notifyListeners();
    API().request(requestType: RequestType.get, endPoint: '/users/continue-watching/1').then((value) {
      if (value['success']) {
        _data = value['data'];
        _isLoading = false;
        _isSuccess = true;
        notifyListeners();
      } else {
        _isLoading = false;
        _isSuccess = false;
        notifyListeners();
      }
    });
  }

  reset() {
    _isSuccess = false;
    _isLoading = true;
    _data.clear();
  }
}
