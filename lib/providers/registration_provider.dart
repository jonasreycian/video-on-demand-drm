import 'package:flutter/foundation.dart';

class RegistrationProvider with ChangeNotifier {
  String _countryCode = '';

  //getter
  String get countryCode => _countryCode;

  //setter

  setCountryCode(value) {
    _countryCode = value;
    notifyListeners();
  }
}
