import 'package:aq_prime/domain/entities/user.dart';

abstract class IAuthenticationRepository {
  Future<User> register(
      String firstName, String lastName, String email, String password);
  Future<void> authenticate(String username, String password);
  Future<bool> isAuthenticated();
  Future<User> getCurrentUser();
  Future<void> forgotPassword(String email);
  Future<void> logout();
}
