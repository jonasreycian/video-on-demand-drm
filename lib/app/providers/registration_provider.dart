import 'package:aq_prime/data/utils/utils.dart';
import 'package:aq_prime/device/utils/api_request.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:aq_prime/device/utils/user_data.dart' as user_data;

class RegistrationProvider with ChangeNotifier {
  bool _isAcceptedTermsAndCondition = true;
  CountryCode _countryCode = CountryCode(code: 'PH', dialCode: '+63', flagUri: 'flags/ph.png', name: 'Pilipinas');
  DateTime? _birthDay;
  String? _message;
  bool _isSuccess = false;
  bool _isLoading = true;
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  bool _isAcceptedTermsAndCondition = false;
  // String _firstName = '';
  // String _lastName = '';
  // String _email = '';
  // String _mobileNumber = '';
  // String _password = '';
  // String _confirmPassword = '';
  //getter

  // String get firstName => _firstName;
  // String get lastName => _lastName;
  // String get email => _email;
  // String get mobileNumber => _mobileNumber;
  // String get password => _password;
  // String get confirmPassword => _confirmPassword;

  CountryCode get countryCode => _countryCode;
  String? get message => _message;
  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  bool get isObscurePassword => _isObscurePassword;
  bool get isObscureConfirmPassword => _isObscureConfirmPassword;
  bool get isAcceptedTermsAndCondition => _isAcceptedTermsAndCondition;
  String? get birthDayString => _birthDay != null ? DateFormat.yMMMMd().format(_birthDay!) : null;

  //setter

  // setFirstName(value) => _firstName = value;
  // setLastName(value) => _lastName = value;
  // setEmail(value) => _email = value;
  // setMobileNumber(value) => _mobileNumber = value;
  // setPassword(value) => _password = value;
  // setConfirmPassword(value) => _confirmPassword = value;
  setTermsAndCondition() {
    _isAcceptedTermsAndCondition = !_isAcceptedTermsAndCondition;
    notifyListeners();
  }

  setBirthDay(DateTime? value) {
    _birthDay = value;
    notifyListeners();
  }

  setCountryCode(value) {
    _countryCode = value;
    notifyListeners();
  }

  setIsObscurePassword() {
    _isObscurePassword = !_isObscurePassword;
    notifyListeners();
  }

  setIsObscureConfirmPassword() {
    _isObscureConfirmPassword = !_isObscureConfirmPassword;
    notifyListeners();
  }

  sendAPI(String _firstName, String _lastName, String _mobileNumber, String _email, String _password, String _confirmPassword) async {
    _message = null;
    _isLoading = true;
    _isSuccess = false;
    final device = await Utils.getDeviceName();
    if (_firstName.isNotEmpty && _lastName.isNotEmpty && _mobileNumber.isNotEmpty && _email.isNotEmpty && _password.isNotEmpty && _confirmPassword.isNotEmpty && _birthDay != null) {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email) && (_password.length >= 8) && (_password == _confirmPassword)) {
        Map<String, dynamic> body = {'first_name': _firstName, 'last_name': _lastName, 'mobile': '${countryCode.dialCode}$_mobileNumber', 'email': _email, 'password': _password, 'password_confirmation': _confirmPassword, 'plan_id': 1, 'status': 1, 'device_name': device};
        API().request(requestType: RequestType.post, parameter: body, endPoint: '/register').then((value) {
          if (value['success']) {
            _message = value['message'];
            notifyListeners();
            ////LOGINGG IN
            Future.delayed(const Duration(milliseconds: 1000), () {
              _message = 'Logging in...';
              notifyListeners();
            });
            Future.delayed(const Duration(milliseconds: 2000), () {
              _isSuccess = true;
              _isLoading = false;
              user_data.saveLoggedIn(value['data']);
              notifyListeners();
            });
            ////LOGINGG IN
          } else {
            _isSuccess = false;
            _isLoading = false;
            _message = 'Email Already Registered.';
            notifyListeners();
          }
        });
      }

      if (_password.length < 8) {
        _message = 'Password must be\n8 characters above';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
      if (_password != _confirmPassword) {
        _message = 'Password do not match';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email)) {
        _message = 'Invalid Email address';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
    } else {
      _message = 'Please Fill-out all fields';
      _isSuccess = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  sendOTP(value) {
    print(value);
  }

  reset() {
    _message = null;
    _isLoading = true;
    _isSuccess = false;
    _isObscurePassword = true;
    _isObscureConfirmPassword = true;
    _isAcceptedTermsAndCondition = false;
    notifyListeners();
    // _birthDay = null;
    // _countryCode = CountryCode(code: 'PH', dialCode: '+63', flagUri: 'flags/ph.png', name: 'Pilipinas');
  }
}
