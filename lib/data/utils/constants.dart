class Constants {
  // APIs
  static const String baseUrl = 'http://$baseUrlNoPrefix';
  static const String usersRoute = '$baseUrl/users';
  static const String loginRoute = '$baseUrl/login';
  static const String forgotPasswordRoute = '$baseUrl/forgot-password';
  static const String contentRoute = '$baseUrl/data.json';
  static const String registerRoute = '$baseUrl/register';

  // APIs no prefix
  static const String baseUrlNoPrefix =
      'netflix-clone-d49e9-default-rtdb.firebaseio.com';

  // Local Storage
  static const String tokenKey = 'authentication_token';
  static const String userKey = 'user_key';
  static const String isAuthenticatedKey = 'isUserAuthenticated';
}
