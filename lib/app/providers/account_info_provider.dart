import 'package:aq_prime/device/utils/api_request.dart';
import 'package:flutter/foundation.dart';
import 'package:aq_prime/device/utils/user_data.dart' as user_data;

class AccountInfoProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  bool _isEditing = false;
  bool _isEditingPassword = false;
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
  bool get isEditing => _isEditing;
  bool get isEditingPassword => _isEditingPassword;

  setIsEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  setIsEditingPassword() {
    _isEditingPassword = !_isEditingPassword;
    notifyListeners();
  }

  setFirstName(value) => _firstName = value;
  setLastName(value) => _lastName = value;
  setMobile(value) => _mobile = value;
  setEmail(value) => _email = value;

  loadData(bool withReset) async {
    if (withReset) reset();
    await user_data.prepareUserData();
    API().request(requestType: RequestType.get, endPoint: '/me').then((value) {
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

  reset() {
    _isSuccess = false;
    _isLoading = false;
    _id = null;
    _firstName = null;
    _lastName = null;
    _mobile = null;
    _email = null;
    _status = null;
    _createdAt = null;
    _plan.clear();
    notifyListeners();
  }
}
