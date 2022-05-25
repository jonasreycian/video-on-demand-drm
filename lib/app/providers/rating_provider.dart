import 'package:aq_prime/device/utils/api_request.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class RatingProvider with ChangeNotifier {
  Future<bool> _process(int contentId) async {
    Map response = await API().request(
      requestType: RequestType.post,
      endPoint: '/contents/$contentId/reaction',
    );
    return response.containsKey('success') ? response['success'] : false;
  }

  Future<bool> setThumbsUp(int contentId) async {
    bool result = await _process(contentId);
    notifyListeners();
    return result;
  }

  Future<bool> setThumbsDown(int contentId) async {
    bool result = await _process(contentId);
    notifyListeners();
    return result;
  }
}
