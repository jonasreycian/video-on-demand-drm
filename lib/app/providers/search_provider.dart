import 'package:aq_prime/device/utils/api_request.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = false;
  List<Content> _data = [];

  bool get isLoading => _isLoading;
  List<Content> get data => _data;
  Future<List<Content>> search(String searchString) async {
    _isLoading = true;
    Map response = await API().request(
      requestType: RequestType.get,
      endPoint: '/contents',
      parameter: {
        'filter[title]': searchString,
      },
    );
    _isSuccess = response['success'];
    _isLoading = false;
    if (_isSuccess) {
      _data =
          (response['data'] as List).map((e) => Content.fromJson(e)).toList();
    }
    notifyListeners();
    return _data;
  }
}
