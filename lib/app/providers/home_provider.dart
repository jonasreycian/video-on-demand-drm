import 'package:aq_prime/device/utils/api_request.dart';
import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  List _data = [];
  List _isFeaturedData = [];
  //getter
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List get data => _data;
  List get isFeaturedData => _isFeaturedData;
  //setter
  loadData() {
    reset();
    notifyListeners();
    API().request(requestType: RequestType.get, endPoint: '/categories/top-ten-categories').then((value) {
      if (value['success'] == true) {
        _data = value['data'];
        _isLoading = false;
        _isSuccess = true;

        for (int i = 0; i < value['data'].length; i++) {
          for (int x = 0; x < value['data'][i].length; x++) {
            if (value['data'][i]['contents'][x]['is_featured']) {
              _isFeaturedData.add(value['data'][i]['contents'][x]);
            }
          }
        }

        notifyListeners();
      } else {
        _isLoading = false;
        _isSuccess = false;
        notifyListeners();
      }
    });
  }

  reset() {
    _isFeaturedData = [];
    _isLoading = true;
    _isSuccess = false;
    _data.clear();
  }
}
