import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../../device/utils/api_request.dart';
import '../../domain/entities/category.dart';

class CategoryContentsProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  Category _data = Category();
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  Category? get data => _data;

  loadData(String slug) {
    reset();
    API().request(
      requestType: RequestType.get,
      endPoint: '/categories/$slug',
      parameter: {'include': 'featuredContent,contents'},
    ).then((value) {
      _isSuccess = value['success'];
      if (_isSuccess) {
        _data = Category.fromJson(value['data']);
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
  }
}
