import 'package:aq_prime/device/utils/api_request.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  List<Content> _featured = [];
  List<Content> _top10Films = [];
  List<Content> _continueWatching = [];
  List<Content> _popularOnAqPrime = [];
  List<Content> _trendingNow = [];
  List<Content> _onlyOnAqPrime = [];
  List<Content> _newReleases = [];
  //getter
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List<Content> get top10Films => _top10Films;
  List<Content> get continueWatching => _continueWatching;
  List<Content> get popularOnAqPrime => _popularOnAqPrime;
  List<Content> get trendingNow => _trendingNow;
  List<Content> get onlyOnAqPrime => _onlyOnAqPrime;
  List<Content> get newReleases => _newReleases;
  List<Content> get featured => _featured;

  List<Content> serialized<T>(List source) {
    return source.map((e) => Content.fromJson(e)).toList();
  }

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
          _featured = serialized(value['data']);
        }
        if (categoryType == CategoryType.popularOnAqPrime) {
          _popularOnAqPrime = serialized(value['data']);
        }
        if (categoryType == CategoryType.onlyOnAqPrime) {
          _onlyOnAqPrime = serialized(value['data']);
        }
        if (categoryType == CategoryType.top10) {
          _top10Films = serialized(value['data']);
        }
        if (categoryType == CategoryType.trendingNow) {
          _trendingNow = serialized(value['data']);
        }
        if (categoryType == CategoryType.newReleases) {
          _newReleases = serialized(value['data']);
        }
        if (categoryType == CategoryType.continueWatching) {
          _continueWatching = serialized(value['data']);
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
  myWatchList,
}
