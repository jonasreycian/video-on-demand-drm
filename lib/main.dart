import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/better_player_provider.dart';
import 'providers/forgot_password_provider.dart';
import 'providers/login_provider.dart';
import 'providers/my_watch_list_provider.dart';
import 'providers/rating_provider.dart';
import 'providers/registration_provider.dart';
import 'providers/search_provider.dart';
import 'screens/categories_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/login_screen.dart';
import 'screens/nav_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/video_details/video_details_screen.dart';
import 'widgets/dismiss_keyboard.dart';

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
            // home: LoginScreen(),
            home: NavScreen(),
            routes: {
              NavScreen.routeName: (context) => NavScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegistrationScreen.routeName: (context) => RegistrationScreen(),
              ForgotPasswordScreen.routeName: (context) =>
                  ForgotPasswordScreen(),
              VideoDetailsPage.routeName: (context) => VideoDetailsPage(),
              CategoriesScreen.routeName: (context) => CategoriesScreen(),
              // SearchScreen.routeName: (context) => SearchScreen(),
              // BetterPlayerScreen.routeName: (context) => BetterPlayerScreen(
              //       content: null,
              //     ),
            },
            // onGenerateRoute: (settings) {
            //   if (settings.name == BetterPlayerScreen.routeName) {
            //     return MaterialPageRoute(
            //       builder: (context) => BetterPlayerScreen(
            //         content: settings.arguments as Content,
            //       ),
            //     );
            //   }
            // },
          ),
        ),
      ),
    );
  }
}
