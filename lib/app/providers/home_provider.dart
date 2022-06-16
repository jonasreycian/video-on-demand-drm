import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/foundation.dart';

import '../../device/utils/api_request.dart';

class HomeProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  List _data = [];
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List get data => _data;

  List<Content> get featured => [];
  List<Content> get popularOnAqPrime => [];
  List<Content> get onlyOnAqPrime => [];
  List<Content> get top10Films => [];
  List<Content> get trendingNow => [];
  List<Content> get newReleases => [];
  List<Content> get continueWatching => [];

  loadData(CategoryType type) {
    reset();
    notifyListeners();
    API()
        .request(
            requestType: RequestType.get,
            endPoint: '/v1/videos/${type.toString()}')
        .then((value) {
      if (value['error_code'] == null) {
        _data = value['data']['data'];
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

enum CategoryType {
  featured,
  popularOnAqPrime,
  onlyOnAqPrime,
  top10,
  trendingNow,
  newReleases,
  continueWatching,
}
