import 'package:aq_prime/device/utils/api_request.dart';
import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  List _featured = [];
  List _top10Films = [];
  List _continueWatching = [];
  List _popularOnAqPrime = [];
  List _trendingNow = [];
  List _onlyOnAqPrime = [];
  List _newReleases = [];
  //getter
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List get top10Films => _top10Films;
  List get continueWatching => _continueWatching;
  List get popularOnAqPrime => _popularOnAqPrime;
  List get trendingNow => _trendingNow;
  List get onlyOnAqPrime => _onlyOnAqPrime;
  List get newReleases => _newReleases;
  List get featured => _featured;
  //setter
  loadData(CategoryType categoryType) {
    reset();
    notifyListeners();
    API()
        .request(
      requestType: RequestType.get,
      parameter: endPointGenerator(categoryType)['parameter'],
      endPoint: endPointGenerator(categoryType)['endPoint'],
    )
        .then((value) {
      if (value['success'] == true) {
        if (categoryType == CategoryType.featured) {
          _featured = value['data'];
        }
        if (categoryType == CategoryType.popularOnAqPrime) {
          _popularOnAqPrime = value['data'];
        }
        if (categoryType == CategoryType.onlyOnAqPrime) {
          _onlyOnAqPrime = value['data'];
        }
        if (categoryType == CategoryType.top10) {
          _top10Films = value['data'];
        }
        if (categoryType == CategoryType.trendingNow) {
          _trendingNow = value['data'];
        }
        if (categoryType == CategoryType.newReleases) {
          _newReleases = value['data'];
        }
        if (categoryType == CategoryType.continueWatching) {
          _continueWatching = value['data'];
        }

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
    _top10Films.clear();
    _continueWatching.clear();
    _popularOnAqPrime.clear();
    _trendingNow.clear();
    _onlyOnAqPrime.clear();
    _newReleases.clear();
    _isLoading = true;
    _isSuccess = false;
  }

  Map<String, dynamic> endPointGenerator(CategoryType type) {
    if (type == CategoryType.featured) {
      return {
        'endPoint': '/contents',
        'parameter': {'filter[is_featured]': 'true'}
      };
    }
    if (type == CategoryType.popularOnAqPrime) {
      return {'endPoint': '/categories/popular-on-aq-prime/contents'};
    }
    if (type == CategoryType.onlyOnAqPrime) {
      return {'endPoint': '/categories/only-on-aq-prime/contents'};
    }
    if (type == CategoryType.top10) {
      return {'endPoint': '/categories/top-10/contents'};
    }
    if (type == CategoryType.trendingNow) {
      return {'endPoint': '/categories/trending-now/contents'};
    }
    if (type == CategoryType.newReleases) {
      return {'endPoint': '/categories/new-releases/contents'};
    }
    if (type == CategoryType.continueWatching) {
      return {'endPoint': '/users/continue-watching'};
    } else {
      return {};
    }
  }
}

enum CategoryType {
  featured,
  top10,
  continueWatching,
  popularOnAqPrime,
  trendingNow,
  onlyOnAqPrime,
  newReleases,
  myWatchList
}
