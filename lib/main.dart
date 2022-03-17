import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/forgot_password_provider.dart';
import 'package:flutter_netflix_responsive_ui/providers/login_provider.dart';
import 'package:flutter_netflix_responsive_ui/providers/registration_provider.dart';
import 'package:flutter_netflix_responsive_ui/screens/forgot_password_screen.dart';
import 'package:flutter_netflix_responsive_ui/screens/login_screen.dart';
import 'package:flutter_netflix_responsive_ui/screens/nav_screen.dart';
import 'package:flutter_netflix_responsive_ui/screens/registration_screen.dart';
import 'package:flutter_netflix_responsive_ui/widgets/dismiss_keyboard.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<RegistrationProvider>(create: (context) => RegistrationProvider()),
          ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
          ChangeNotifierProvider<ForgotPasswordProvider>(create: (context) => ForgotPasswordProvider()),
        ],
        child: MaterialApp(
          title: 'AQ-Prime',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.black,
          ),
          home: LoginScreen(),
          routes: {
            NavScreen.routeName: (context) => NavScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            Registration.routeName: (context) => Registration(),
            ForgotPassword.routeName: (context) => ForgotPassword(),
          },
        ),
      ),
    );
  }
}
