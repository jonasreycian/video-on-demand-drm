import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../widgets/registration_card.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  static const routeName = '/registrationScreen';
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/AQ_Background.jpg'),
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
        body: AnimationConfiguration.staggeredList(
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
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).padding.top + 52 + 32),
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
                top: MediaQuery.of(context).padding.top + 52,
                // bottom: 16,
              ),
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: RegistrationCard(
                firstName: firstName,
                lastName: lastName,
                confirmPassword: confirmPassword,
                email: email,
                mobileNumber: mobileNumber,
                password: password,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
