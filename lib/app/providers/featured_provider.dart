import 'package:aq_prime/device/utils/api_request.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class FeaturedProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  final List<Content> _data = [];
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List<Content> get data => _data;

  loadData() {
    reset();
    API()
        .request(
            requestType: RequestType.get,
            endPoint: '/categories/featured/contents')
        .then((value) {
      _isSuccess = value['success'];
      if (_isSuccess) {
        List temp = value['data'];
        List<Content> serialized =
            temp.map((e) => Content.fromJson(e)).toList();
        _data.addAll(serialized);
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
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
