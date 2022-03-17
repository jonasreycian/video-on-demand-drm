import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/reset_password_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  static const routeName = '/forgotPassword';

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = ResetPasswordCardEmail();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimationConfiguration.staggeredList(
            position: 0,
            child: SingleChildScrollView(
              child: Container(
                height: 500,
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  layoutBuilder: (widget, animation) {
                    return FadeInAnimation(
                      duration: const Duration(milliseconds: 500),
                      child: widget!,
                      delay: const Duration(milliseconds: 100),
                    );
                  },
                  child: currentWidget,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
