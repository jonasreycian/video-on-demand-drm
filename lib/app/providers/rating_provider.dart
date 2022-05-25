import 'package:aq_prime/device/utils/api_request.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class RatingProvider with ChangeNotifier {
  setThumbsUp(int contentId) {
    API()
        .request(
      requestType: RequestType.post,
      endPoint: '/contents/$contentId/reaction',
    )
        .then((value) {
      var success = value['success'];
      if (success) {
        notifyListeners();
      } else {
        notifyListeners();
      }
    });
    notifyListeners();
  }
}
