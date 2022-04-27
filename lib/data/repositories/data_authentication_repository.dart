import 'package:aq_prime/domain/entities/user.dart';
import 'package:aq_prime/domain/repositories/authentication_repository.dart';

class DataAuthenticationRepository extends IAuthenticationRepository {
  // singleton
  static final DataAuthenticationRepository _instance =
      DataAuthenticationRepository._internal();
  DataAuthenticationRepository._internal();
  factory DataAuthenticationRepository() => _instance;

  @override
  Future<void> authenticate(String username, String password) {
    // TODO: implement authenticate
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<User> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isAuthenticated() {
    // TODO: implement isAuthenticated
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User> register(
      String firstName, String lastName, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
