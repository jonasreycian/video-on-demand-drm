import 'package:aq_prime/device/utils/api_request.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

enum Rate { up, down }

class RatingProvider with ChangeNotifier {
  Future<bool> _process(int contentId, Rate rate) async {
    Map response = await API().request(
        requestType: RequestType.post,
        endPoint: '/contents/$contentId/reaction',
        parameter: {'value': rate == Rate.up ? 'thumbs-up' : 'thumbs-down'});
    return response.containsKey('success') ? response['success'] : false;
  }

  Future<bool> setThumbsUp(int contentId) async {
    bool result = await _process(contentId, Rate.up);
    notifyListeners();
    return result;
  }

  Future<bool> setThumbsDown(int contentId) async {
    bool result = await _process(contentId, Rate.down);
    notifyListeners();
    return result;
  }
}
