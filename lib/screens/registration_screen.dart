import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/registration_provider.dart';
import 'package:flutter_netflix_responsive_ui/widgets/enter_otp_card.dart';
import 'package:flutter_netflix_responsive_ui/widgets/registration_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  static const routeName = '/registrationScreen';
  late Widget currentWidget;
  late double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
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
              child: Consumer<RegistrationProvider>(builder: (context, value, child) {
                if (value.isSuccess) {
                  currentWidget = RegistraionEnterOtpCard();
                  height = 400;
                }
                if (!value.isSuccess) {
                  currentWidget = RegistrationCard();
                  height = 810;
                }
                return SingleChildScrollView(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: height,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.black54,
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
                      child: currentWidget,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
