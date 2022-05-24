import 'dart:convert';

import 'package:aq_prime/device/utils/api_request.dart';
import 'package:aq_prime/domain/entities/category.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class CategoryListingProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  final List<Category> _data = [];
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List<Category> get data => _data;

  loadData(int videoId) {
    reset();
    API()
        .request(
            requestType: RequestType.get, endPoint: '/api/v1/contents/$videoId')
        .then((value) {
      _isSuccess = value['success'];
      if (_isSuccess) {
        List temp = value['data'];
        List<Category> serialized =
            temp.map((e) => Category.fromJson(jsonEncode(e))).toList();
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
