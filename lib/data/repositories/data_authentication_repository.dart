import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../utils/constants.dart';
import '../utils/http_helper.dart';

/// `DataAuthenticationRepository` is the implementation of `AuthenticationRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataAuthenticationRepository implements AuthenticationRepository {
  // Members
  // Singleton object of `DataAuthenticationRepository`
  static final DataAuthenticationRepository _instance =
      DataAuthenticationRepository._internal();
  late Logger _logger;

  // Constructor
  DataAuthenticationRepository._internal() {
    _logger = Logger('DataAuthenticationRepository');
  }

  factory DataAuthenticationRepository() => _instance;

  /// Logs in a `User` using a [email] and a [password] by making an API call to the server.
  /// It is asynchronous and can throw an `APIException` if the statusCode is not 200.
  /// When successful, it attempts to save the credentials of the `User` to local storage by
  /// calling [_saveCredentials]. Throws an `Exception` if an Internet connection cannot be
  /// established. Throws a `ClientException` if the http object fails.
  @override
  Future<void> authenticate(
      {required String email, required String password}) async {
    try {
      // make the API call
      Map<String, dynamic> body = await HttpHelper.invokeHttp(
          Constants.loginRoute, RequestType.post,
          body: {
            'email': email,
            'password': password,
          });
      _logger.finest('Login Successful.');

      User user = User.fromJson(body);
      _saveCredentials(token: body['token'], user: user);
    } catch (e) {
      _logger.warning(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await HttpHelper.invokeHttp(
          Constants.forgotPasswordRoute, RequestType.post,
          body: {
            'email': email,
          });
      _logger.finest('Forgot Password Successful.');
    } catch (e) {
      _logger.warning(e.toString());
      rethrow;
    }
  }

  /// Return the current authenticated `User` from `SharedPreferences`.
  @override
  Future<User> getCurrentUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userJson = prefs.getString(Constants.userKey);
      return User.fromJson(json.decode(userJson!));
    } catch (e) {
      _logger.warning("Couldn't get current user.", e);
      rethrow;
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool? isAuthenticated = preferences.getBool(Constants.isAuthenticatedKey);
      return isAuthenticated ?? false;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<void> logout() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.remove(Constants.isAuthenticatedKey);
      preferences.remove(Constants.tokenKey);
      _logger.finest('Logout successful.');
    } catch (error) {
      _logger.warning('Could not log out.', error);
    }
  }

  /// Registers a `User` using a [email] and a [password] by making an API call to the server.
  /// It is asynchronous and can throw an `APIException` if the statusCode is not 200.
  @override
  Future<void> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      await HttpHelper.invokeHttp(Constants.registerRoute, RequestType.post,
          body: {
            'first_name': firstName,
            'last_name': lastName,
            'email': email,
            'password': password,
          });

      _logger.finest('Register Successful.');
    } catch (e) {
      _logger.warning("Couldn't register a new user.", e);
      rethrow;
    }
  }

  /// Saves the [token] and the [user] in `SharedPreferences`.
  void _saveCredentials({@required String? token, @required User? user}) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await Future.wait([
        preferences.setString(Constants.tokenKey, token!),
        preferences.setBool(Constants.isAuthenticatedKey, true),
        preferences.setString(Constants.userKey, jsonEncode(user))
      ]);
    } catch (error) {
      rethrow;
    }
  }
}
