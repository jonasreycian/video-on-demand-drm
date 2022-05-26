import 'package:aq_prime/app/widgets/reset_password_email_card.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgotPassword';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Center(
          child: AnimationConfiguration.staggeredList(
            position: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              layoutBuilder: (widget, animation) {
                return FadeInAnimation(
                  duration: const Duration(milliseconds: 800),
                  child: widget!,
                  delay: const Duration(milliseconds: 1000),
                );
              },
              child: SingleChildScrollView(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 480,
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.80),
                    border: Border.all(
                      color: HexColor('#D4030B'),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 800),
                    layoutBuilder: (widget, animation) {
                      return FadeInAnimation(
                        duration: const Duration(milliseconds: 800),
                        child: widget!,
                        delay: const Duration(milliseconds: 1000),
                      );
                    },
                    child: ResetPasswordCard(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
