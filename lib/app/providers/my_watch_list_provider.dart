import 'package:aq_prime/device/utils/api_request.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/foundation.dart';

class MyWatchListProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  List<Content> _data = <Content>[];
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List<Content> get data => _data;

  Future<bool> addToWatchList(int contentId) async {
    var response = await API().request(
      requestType: RequestType.post,
      endPoint: '/users/watch-lists',
      body: {'content_id': contentId.toString()},
    );
    loadWatchList();
    return Future.value(response['success']);
  }

  Future<bool> removeFromWatchList(int contentId) async {
    var response = await API().request(
      requestType: RequestType.delete,
      endPoint: '/users/watch-lists/$contentId',
    );
    loadWatchList();
    return Future.value(response['success']);
  }

  loadWatchList() {
    reset();
    API()
        .request(
      requestType: RequestType.get,
      endPoint: '/users/watch-lists',
    )
        .then(
      (value) {
        _isSuccess = value['success'];
        if (_isSuccess) {
          _data = (value['data'] as List)
              .map(
                (e) => Content.fromJson(e),
              )
              .toList();
          _isLoading = false;
          notifyListeners();
        } else {
          _isLoading = false;
          notifyListeners();
        }
      },
    );
  }

  reset() {
    _isLoading = true;
    _isSuccess = false;
  }
}
