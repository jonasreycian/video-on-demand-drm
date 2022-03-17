import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';

class ForgotPasswordProvider with ChangeNotifier {
  CountryCode _countryCode = CountryCode(code: 'PH', dialCode: '+63', flagUri: 'flags/ph.png', name: 'Pilipinas');
  String _hintText = 'Email';
  TextInputType _textInputType = TextInputType.text;
  String _selectedWidgetCard = 'Reset via Mobile Number';
  List<String> _choices = ['Reset via Mobile Number', 'Reset via Email'];

  //getter
  String get hintText => _hintText;
  TextInputType get textInputType => _textInputType;
  String get selectedWidgetCard => _selectedWidgetCard;
  List<String> get choices => [..._choices];
  //setter
  setSelectedWidgetCard(value) {
    _selectedWidgetCard = value;
    if (_selectedWidgetCard == _choices[0]) {
      _hintText = 'Email';
      _textInputType = TextInputType.text;
    }
    if (_selectedWidgetCard == _choices[1]) {
      _hintText = 'Mobile number';
      _textInputType = TextInputType.number;
    }
    notifyListeners();
  }
}
