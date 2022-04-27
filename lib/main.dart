import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app/providers/better_player_provider.dart';
import 'app/providers/forgot_password_provider.dart';
import 'app/providers/login_provider.dart';
import 'app/providers/my_watch_list_provider.dart';
import 'app/providers/rating_provider.dart';
import 'app/providers/registration_provider.dart';
import 'app/providers/search_provider.dart';
import 'app/screens/categories_screen.dart';
import 'app/screens/forgot_password_screen.dart';
import 'app/screens/login_screen.dart';
import 'app/screens/nav_screen.dart';
import 'app/screens/registration_screen.dart';
import 'app/screens/video_details/video_details_screen.dart';
import 'app/widgets/dismiss_keyboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: DismissKeyboard(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<RegistrationProvider>(
                create: (context) => RegistrationProvider()),
            ChangeNotifierProvider<LoginProvider>(
                create: (context) => LoginProvider()),
            ChangeNotifierProvider<ForgotPasswordProvider>(
                create: (context) => ForgotPasswordProvider()),
            ChangeNotifierProvider<MyWatchListProvider>(
                create: (context) => MyWatchListProvider()),
            ChangeNotifierProvider<SearchProvider>(
                create: (context) => SearchProvider()),
            ChangeNotifierProvider<RatingProvider>(
                create: (context) => RatingProvider()),
            ChangeNotifierProvider<BetterPlayerProvider>(
                create: (context) => BetterPlayerProvider()),
          ],
          child: MaterialApp(
            darkTheme: ThemeData.dark(),
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
              RegistrationScreen.routeName: (context) => RegistrationScreen(),
              ForgotPasswordScreen.routeName: (context) =>
                  ForgotPasswordScreen(),
              VideoDetailsPage.routeName: (context) => VideoDetailsPage(),
              CategoriesScreen.routeName: (context) => CategoriesScreen(),
            },
          ),
        ),
      ),
    );
  }
}
