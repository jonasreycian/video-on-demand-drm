import 'package:aq_prime/providers/my_watch_list_provider.dart';
import 'package:aq_prime/providers/rating_provider.dart';
import 'package:aq_prime/providers/search_provider.dart';
import 'package:aq_prime/screens/categories_screen.dart';
import 'package:aq_prime/screens/search_screen.dart';
import 'package:aq_prime/screens/video_details/video_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:aq_prime/providers/forgot_password_provider.dart';
import 'package:aq_prime/providers/login_provider.dart';
import 'package:aq_prime/providers/registration_provider.dart';
import 'package:aq_prime/screens/forgot_password_screen.dart';
import 'package:aq_prime/screens/login_screen.dart';
import 'package:aq_prime/screens/nav_screen.dart';
import 'package:aq_prime/screens/registration_screen.dart';
import 'package:aq_prime/widgets/dismiss_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('loggedIn') == null) prefs.setBool('loggedIn', false);
  if (prefs.getBool('loggedIn')!) initialRoute = NavScreen.routeName;
  runApp(MyApp());
}

String initialRoute = LoginScreen.routeName;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<RegistrationProvider>(create: (context) => RegistrationProvider()),
          ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
          ChangeNotifierProvider<ForgotPasswordProvider>(create: (context) => ForgotPasswordProvider()),
          ChangeNotifierProvider<MyWatchListProvider>(create: (context) => MyWatchListProvider()),
          ChangeNotifierProvider<SearchProvider>(create: (context) => SearchProvider()),
          ChangeNotifierProvider<RatingProvider>(create: (context) => RatingProvider()),
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
          initialRoute: initialRoute,
          routes: {
            NavScreen.routeName: (context) => NavScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            RegistrationScreen.routeName: (context) => RegistrationScreen(),
            ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
            VideoDetailsPage.routeName: (context) => VideoDetailsPage(),
            CategoriesScreen.routeName: (context) => CategoriesScreen(),
            SearchScreen.routeName: (context) => SearchScreen(),
          },
        ),
      ),
    );
  }
}
