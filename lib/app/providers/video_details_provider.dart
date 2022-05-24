import 'package:aq_prime/device/utils/api_request.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/foundation.dart';

class VideoDetailsProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  Content? _data;

  //getter
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  Content? get data => _data;

  //setter
  loadData(int contentId) {
    API()
        .request(requestType: RequestType.get, endPoint: '/contents/$contentId')
        .then((value) {
      if (value['success'] == true) {
        _data = Content.fromJson(value['data']);
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
    _data = null;
  }
}
