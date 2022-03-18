import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/forgot_password_provider.dart';
import 'package:flutter_netflix_responsive_ui/widgets/enter_new_password.dart';
import 'package:flutter_netflix_responsive_ui/widgets/enter_otp_card.dart';
import 'package:flutter_netflix_responsive_ui/widgets/reset_password_email_card.dart';
import 'package:flutter_netflix_responsive_ui/widgets/reset_password_mobile_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgotPassword';
  late Widget currentWidget;
  late double height;
  @override
  Widget build(BuildContext context) {
    ForgotPasswordProvider forgotPasswordProvider = Provider.of<ForgotPasswordProvider>(context);
    if (forgotPasswordProvider.selectedWidgetCard == forgotPasswordProvider.choices[0]) {
      currentWidget = ResetPasswordCardMobile();
      height = 400;
    }
    if (forgotPasswordProvider.selectedWidgetCard == forgotPasswordProvider.choices[1]) {
      currentWidget = ResetPasswordCardEmail();
      height = 400;
    }
    if (forgotPasswordProvider.isSuccess && forgotPasswordProvider.isSuccessOtp) {
      currentWidget = EnterNewPassword();
      height = 400;
    }
    if (forgotPasswordProvider.isSuccess && !forgotPasswordProvider.isSuccessOtp) {
      currentWidget = EnterOtpCard();
      height = 340;
    }
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
            child: SingleChildScrollView(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: height,
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
            ),
          ),
        ),
      ),
    );
  }
}
