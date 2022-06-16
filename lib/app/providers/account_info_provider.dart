import 'package:flutter/foundation.dart';

import '../../device/utils/api_request.dart';
import '../../device/utils/user_data.dart' as user_data;
import '../../domain/entities/user.dart';

class AccountInfoProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  bool _isEditing = false;
  bool _isEditingPassword = false;
  User? _user;
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  bool get isEditing => _isEditing;
  bool get isEditingPassword => _isEditingPassword;
  User? get user => _user;

  setIsEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  setIsEditingPassword() {
    _isEditingPassword = !_isEditingPassword;
    notifyListeners();
  }

  setFirstName(value) => _user!.firstName = value;
  setLastName(value) => _user!.lastName = value;
  setMobile(value) => _user!.mobile = value;
  setEmail(value) => _user!.email = value;

  loadData(bool withReset) async {
    if (withReset) reset();
    API().request(requestType: RequestType.get, endPoint: '/me').then((value) {
      if (value['success'] != null) {
        _isSuccess = true;
        _isLoading = false;
        _user = User.fromJson(value['data']);
        user_data.saveLoggedIn(value['data']);
        notifyListeners();
      } else {
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  update() {
    API().request(
      requestType: RequestType.put,
      endPoint: '/users/update',
      body: {
        'first_name': user!.firstName,
        'last_name': user!.lastName,
        'mobile': user!.mobile,
        'email': user!.email,
        'birthdate': user!.birthdate,
        'status': true,
      },
    ).then((value) {
      if (value['success'] != null) {
        _user = User.fromJson(value['data']);
        user_data.saveLoggedIn(value['data']);
        // notifyListeners();
        // loadData(false);
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
    _user = null;
    notifyListeners();
  }
}
