import 'package:aq_prime/data/extra/data.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  bool _isSearching = false;
  bool _isLoading = true;
  final List<Content> _data = [...combine(), ...trending];
  final List<Content> _searchData = [];

  bool get isSearching => _isSearching;
  bool get isLoading => _isLoading;
  List<Content> get data => _data;
  List<Content> get searchData => _searchData;
  searched(searchString) {
    _searchData.clear();
    for (var i = 0; i < _data.length; i++) {
      if (_data[i].title!.toLowerCase().contains(searchString.toLowerCase())) {
        _searchData.add(_data[i]);
      }
    }

    notifyListeners();
  }

  reset() {
    _isSearching = false;
    _isLoading = true;
    _searchData.clear();
    notifyListeners();
  }
}
