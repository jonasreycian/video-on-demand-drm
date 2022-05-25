import 'package:aq_prime/device/utils/api_request.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/foundation.dart';

class SeasonProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  List<Content>? _seasons;

  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List<Content> get seasons => _seasons ?? [];

  getrSeasons(int contentId, int seasonId) {
    API()
        .request(
            requestType: RequestType.get,
            endPoint: '/contents/$contentId/seasons')
        .then((value) {
      if (value['success'] == true) {
        _seasons =
            (value['data'] as List).map((e) => Content.fromJson(e)).toList();
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
    _seasons = [];
  }
}
