import 'package:flutter/foundation.dart';

class Rating {
  final String? movieName;
  bool? isThumbsUp;
  Rating({this.movieName, this.isThumbsUp});
}

class RatingProvider with ChangeNotifier {
  final List<Rating> _data = [];

  List<Rating> get data => _data;

  bool? isThumbsUp(String? movieName) {
    bool? returnVal;
    for (var i = 0; i < _data.length; i++) {
      if (movieName == _data[i].movieName) {
        returnVal = _data[i].isThumbsUp;
        break;
      } else {
        continue;
      }
    }
    return returnVal;
  }

  setThumbsUp(String movieName, bool value) {
    int removeLocation = -1;
    bool _isExist = false;
    for (var i = 0; i < _data.length; i++) {
      if (movieName == _data[i].movieName) {
        _isExist = true;
        if (_data[i].isThumbsUp == value) {
          removeLocation = i;
        } else {
          _data[i].isThumbsUp = value;
          break;
        }
      }
    }
    if (removeLocation != -1) _data.removeAt(removeLocation);
    if (!_isExist) _data.add(Rating(movieName: movieName, isThumbsUp: value));
    notifyListeners();
  }
}
