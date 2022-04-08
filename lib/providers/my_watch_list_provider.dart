import 'package:flutter/foundation.dart';

import '../models/models.dart';

class MyWatchListProvider with ChangeNotifier {
  final List<Content> _myWatchList = [];

  List<Content> get myWatchList => _myWatchList;

  addMyWatchList(Content data) {
    _myWatchList.add(data);
    notifyListeners();
  }

  removeWatchList(Content data) {
    int location = _myWatchList.indexWhere((element) => element.name == data.name);
    _myWatchList.removeAt(location);
    notifyListeners();
  }

  bool isExisting(Content data) {
    bool returnVal = false;
    for (var i = 0; i < _myWatchList.length; i++) {
      if (data.name == _myWatchList[i].name) {
        returnVal = true;
        break;
      } else {
        continue;
      }
    }
    return returnVal;
  }
}
