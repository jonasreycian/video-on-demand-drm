import 'package:aq_prime/app/providers/better_player_provider.dart';
import 'package:aq_prime/app/providers/forgot_password_provider.dart';
import 'package:aq_prime/app/providers/login_provider.dart';
import 'package:aq_prime/app/providers/my_watch_list_provider.dart';
import 'package:aq_prime/app/providers/rating_provider.dart';
import 'package:aq_prime/app/providers/search_provider.dart';
import 'package:aq_prime/app/screens/categories_screen.dart';
import 'package:aq_prime/app/screens/forgot_password_screen.dart';
import 'package:aq_prime/app/screens/login_screen.dart';
import 'package:aq_prime/app/screens/nav_screen.dart';
import 'package:aq_prime/app/screens/registration_screen.dart';
import 'package:aq_prime/app/screens/search_screen.dart';
import 'package:aq_prime/app/screens/video_details/video_details_screen.dart';
import 'package:aq_prime/app/widgets/dismiss_keyboard.dart';
import 'package:aq_prime/providers/account_info_provider.dart';
import 'package:aq_prime/providers/category_listing_provider.dart';
import 'package:aq_prime/providers/continue_watching_provider.dart';
import 'package:aq_prime/providers/home_provider.dart';
import 'package:aq_prime/providers/refresh_limiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/providers/registration_provider.dart';

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
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: DismissKeyboard(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<BetterPlayerProvider>(create: (context) => BetterPlayerProvider()),
            ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
            ChangeNotifierProvider<RegistrationProvider>(create: (context) => RegistrationProvider()),
            ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
            ChangeNotifierProvider<ForgotPasswordProvider>(create: (context) => ForgotPasswordProvider()),
            ChangeNotifierProvider<MyWatchListProvider>(create: (context) => MyWatchListProvider()),
            ChangeNotifierProvider<SearchProvider>(create: (context) => SearchProvider()),
            ChangeNotifierProvider<RatingProvider>(create: (context) => RatingProvider()),
            ChangeNotifierProvider<AccountInfoProvider>(create: (context) => AccountInfoProvider()),
            ChangeNotifierProvider<CategoryListingProvider>(create: (context) => CategoryListingProvider()),
            ChangeNotifierProvider<RefreshLimit>(create: (context) => RefreshLimit()),
            ChangeNotifierProvider<ContinueWatching>(create: (context) => ContinueWatching())
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
      ),
    );
  }
}
