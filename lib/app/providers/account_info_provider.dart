import 'package:aq_prime/domain/entities/user.dart';
import 'package:flutter/foundation.dart';

import '../../device/utils/api_request.dart';
import '../../device/utils/user_data.dart' as user_data;

class AccountInfoProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;

  int? _id;
  String? _firstName;
  String? _lastName;
  String? _mobile;
  String? _email;
  bool? _status;
  String? _createdAt;
  Map<String, dynamic> _plan = {};
  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get mobile => _mobile;
  String? get email => _email;
  bool? get status => _status;
  String? get createdAt => _createdAt;
  Map<String, dynamic> get plan => _plan;
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;

  bool _isEditing = false;
  bool get isEditing => _isEditing;
  void setIsEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  User? _user;
  User? get user => _user;
  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  void setFirstName(String? value) {
    _firstName = value;
    notifyListeners();
  }

  void setLastName(String? value) {
    _lastName = value;
    notifyListeners();
  }

  void setEmail(String? value) {
    _email = value;
    notifyListeners();
  }

  void setMobile(String? value) {
    _mobile = value;
    notifyListeners();
  }

  void update() {
    _isLoading = true;
    notifyListeners();
    API().request(
        requestType: RequestType.post,
        endPoint: '/update-account-info',
        parameter: {
          'firstName': _firstName,
          'lastName': _lastName,
          'email': _email,
          'mobile': _mobile,
        }).then((value) {
      _isLoading = false;
      _isSuccess = true;
      notifyListeners();
    }).catchError((error) {
      _isLoading = false;
      _isSuccess = false;
      notifyListeners();
    });
  }

  loadData() async {
    await user_data.prepareUserData();
    API()
        .request(requestType: RequestType.get, endPoint: '/v1/me')
        .then((value) {
      if (value['success'] != null) {
        _isSuccess = true;
        _isLoading = false;
        _id = value['data']['id'];
        _firstName = value['data']['first_name'];
        _lastName = value['data']['last_name'];
        _mobile = value['data']['mobile'];
        _email = value['data']['email'];
        _plan = value['data']['plan'];
        notifyListeners();
      } else {
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
    });
  }
}
