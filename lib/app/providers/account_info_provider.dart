import 'package:aq_prime/device/utils/api_request.dart';
import 'package:flutter/foundation.dart';
import 'package:aq_prime/device/utils/user_data.dart' as user_data;

class AccountInfoProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;
  bool _isEditing = false;

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

  setIsEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  loadData() async {
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
}
