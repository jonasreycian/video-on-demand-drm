import 'package:aq_prime/data/utils/utils.dart';
import 'package:aq_prime/device/utils/api_request.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:aq_prime/device/utils/user_data.dart' as user_data;

class RegistrationProvider with ChangeNotifier {
  bool _isAcceptedTermsAndCondition = false;
  CountryCode _countryCode = CountryCode(
      code: 'PH', dialCode: '+63', flagUri: 'flags/ph.png', name: 'Pilipinas');
  DateTime? _birthDay;
  String? _message;
  bool _isSuccess = false;
  bool _isLoading = true;
  bool _isValidationComplete = false;
  //---------------------------
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  //---------------------------
  bool _firstNameError = false;
  bool _lastNameError = false;
  bool _emailError = false;
  bool _birthDayError = false;
  bool _mobileError = false;
  bool _passwordError = false;
  bool _confirmPasswordError = false;
  //---------------------------

//getter
  CountryCode get countryCode => _countryCode;
  String? get message => _message;
  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  bool get isValidationComplete => _isValidationComplete;
  bool get isObscurePassword => _isObscurePassword;
  bool get isObscureConfirmPassword => _isObscureConfirmPassword;
  bool get isAcceptedTermsAndCondition => _isAcceptedTermsAndCondition;
  String? get birthDayString =>
      _birthDay != null ? DateFormat.yMMMMd().format(_birthDay!) : null;
  //------------------------
  bool get firstNameError => _firstNameError;
  bool get lastNameError => _lastNameError;
  bool get emailError => _emailError;
  bool get birthDayError => _birthDayError;
  bool get mobileError => _mobileError;
  bool get passwordError => _passwordError;
  bool get confirmPasswordError => _confirmPasswordError;
  //------------------------
  //setter

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

  sendAPI(String _firstName, String _lastName, String _mobileNumber,
      String _email, String _password, String _confirmPassword) async {
    _message = null;
    _isLoading = true;
    _isSuccess = false;
    fieldsValidations(
      _firstName,
      _lastName,
      _email,
      _birthDay,
      _mobileNumber,
      _password,
      _confirmPassword,
    );
    final device = await Utils.getDeviceName();
    if (_firstName.isNotEmpty &&
        _lastName.isNotEmpty &&
        _mobileNumber.isNotEmpty &&
        _email.isNotEmpty &&
        _password.isNotEmpty &&
        _confirmPassword.isNotEmpty &&
        _birthDay != null) {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(_email) &&
          (_password.length >= 8) &&
          (_password == _confirmPassword)) {
        _isValidationComplete = true;
        notifyListeners();
        Map<String, dynamic> body = {
          'first_name': _firstName,
          'last_name': _lastName,
          'mobile': '${countryCode.dialCode}$_mobileNumber',
          'email': _email,
          'password': _password,
          'password_confirmation': _confirmPassword,
          'plan_id': 1,
          'status': 1,
          'device_name': device
        };
        API()
            .request(
                requestType: RequestType.post,
                parameter: body,
                endPoint: '/register')
            .then((value) {
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
            _isValidationComplete = false;
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
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_email)) {
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

  fieldsValidations(
    _firstName,
    _lastName,
    _email,
    _birthDay,
    _mobileNumber,
    _password,
    _confirmPassword,
  ) {
    if (_firstName == '') {
      _firstNameError = true;
    }
    if (_lastName == '') {
      _lastNameError = true;
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email)) {
      _emailError = true;
    }
    if (_birthDay == null) {
      _birthDayError = true;
    }
    if (_mobileNumber == '') {
      _mobileError = true;
    }
    if (_password.length < 8) {
      _passwordError = true;
    }
    if (_confirmPassword.length < 8) {
      _confirmPasswordError = true;
    }
    if (_password != _confirmPassword) {
      _passwordError = true;
      _confirmPasswordError = true;
    }
  }

  reset() {
    _firstNameError = false;
    _lastNameError = false;
    _emailError = false;
    _birthDayError = false;
    _mobileError = false;
    _passwordError = false;
    _confirmPasswordError = false;

    _message = null;
    _isLoading = true;
    _isSuccess = false;
    _isValidationComplete = false;
    _isObscurePassword = true;
    _isObscureConfirmPassword = true;
    _isAcceptedTermsAndCondition = false;
    notifyListeners();
  }
}
