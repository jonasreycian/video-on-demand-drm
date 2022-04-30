import 'package:aq_prime/device/utils/api_request.dart';
import 'package:flutter/foundation.dart';

class CategoryListingProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  Map _data = {};
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  Map get data => _data;

  loadData() {
    reset();
    notifyListeners();
    API().request(requestType: RequestType.get, endPoint: '/videos').then((value) {
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
    _isLoading = true;
    _isSuccess = false;
    _data.clear();
  }
}
