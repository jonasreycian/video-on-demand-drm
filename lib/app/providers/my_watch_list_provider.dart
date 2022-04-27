import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/foundation.dart';

class MyWatchListProvider with ChangeNotifier {
  final List<Content> _myWatchList = [];

  List<Content> get myWatchList => _myWatchList;

  addMyWatchList(Content data) {
    _myWatchList.add(data);
    notifyListeners();
  }

  removeWatchList(Content data) {
    int location =
        _myWatchList.indexWhere((element) => element.title == data.title);
    _myWatchList.removeAt(location);
    notifyListeners();
  }

  bool isExisting(Content data) {
    bool returnVal = false;
    for (var i = 0; i < _myWatchList.length; i++) {
      if (data.title == _myWatchList[i].title) {
        returnVal = true;
        break;
      } else {
        continue;
      }
    }
    return returnVal;
  }
}
