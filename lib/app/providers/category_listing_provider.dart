import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../../device/utils/api_request.dart';
import '../../domain/entities/category.dart';

class CategoryListingProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  List<Category> _data = <Category>[];
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List<Category> get data => _data;

  loadData() {
    reset();
    notifyListeners();
    API()
        .request(requestType: RequestType.get, endPoint: '/categories')
        .then((value) {
      if (value['success']) {
        List temp = value['data'];
        List<Category> serialized =
            temp.map((e) => Category.fromJson(e)).toList();
        _data = serialized;
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
