import 'package:flutter/foundation.dart';

import '../../device/utils/api_request.dart';
import '../../domain/entities/video.dart';

class EpisodesProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  List<Video>? _episodes;

  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  List<Video> get episodes => _episodes ?? [];

  getEpisodes(int contentId, int seasonId) {
    API()
        .request(
            requestType: RequestType.get,
            endPoint: '/contents/$contentId/seasons/$seasonId/videos')
        .then((value) {
      if (value['success'] == true) {
        _episodes =
            (value['data'] as List).map((e) => Video.fromJson(e)).toList();
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
    _episodes = [];
  }
}
