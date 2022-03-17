import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/forgot_password_provider.dart';
import 'package:flutter_netflix_responsive_ui/widgets/enter_otp_card.dart';
import 'package:flutter_netflix_responsive_ui/widgets/reset_password_email_card.dart';
import 'package:flutter_netflix_responsive_ui/widgets/reset_password_mobile_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  static const routeName = '/forgotPassword';
  late Widget currentWidget;
  @override
  Widget build(BuildContext context) {
    ForgotPasswordProvider forgotPasswordProvider = Provider.of<ForgotPasswordProvider>(context);
    if (forgotPasswordProvider.selectedWidgetCard == forgotPasswordProvider.choices[0]) {
      currentWidget = ResetPasswordCardMobile();
    }
    if (forgotPasswordProvider.selectedWidgetCard == forgotPasswordProvider.choices[1]) {
      currentWidget = ResetPasswordCardEmail();
    }
    if (forgotPasswordProvider.isSuccess) {
      currentWidget = EnterOtpCard();
    }
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
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
                height: 400,
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
