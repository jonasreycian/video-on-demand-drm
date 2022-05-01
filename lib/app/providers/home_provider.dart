import 'package:flutter/foundation.dart';

import '../../device/utils/api_request.dart';

class HomeProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  List _data = [];
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List get data => _data;

  loadData() {
    reset();
    notifyListeners();
    API()
        .request(requestType: RequestType.get, endPoint: '/videos')
        .then((value) {
      if (value['error_code'] == null) {
        _data = value['data']['data'];
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
