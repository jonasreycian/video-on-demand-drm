import 'package:aq_prime/device/utils/api_request.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class RelatedContentProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  List<Content> _data = <Content>[];

  //getter
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List<Content>? get data => _data;

  //setter
  loadData(int contentId) {
    reset();
    API()
        .request(
      requestType: RequestType.get,
      endPoint: '/contents/$contentId/content-related',
    )
        .then((value) {
      _isSuccess = value['success'];
      if (_isSuccess) {
        _data =
            (value['data'] as List).map((e) => Content.fromJson(e)).toList();
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  reset() {
    _data.clear();
    _isLoading = true;
    _isSuccess = false;
  }
}
