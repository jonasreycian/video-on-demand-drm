import 'package:aq_prime/app/providers/forgot_password_provider.dart';
import 'package:aq_prime/app/widgets/enter_otp_card.dart';
import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/app/widgets/registration_input_field.dart';
import 'package:aq_prime/app/widgets/text_and_link.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class ResetPasswordCard extends StatelessWidget {
  ResetPasswordCard({
    Key? key,
  }) : super(key: key);

  // final TextEditingController emailNumber =
  // TextEditingController(text: 'jesther11@yahoo.com');
  final TextEditingController emailNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('Parent Rebuild');
    return Consumer<ForgotPasswordProvider>(
      child: OtpView(),
      builder: (context, value, child) {
        print('child Rebuild');
        Future.delayed(const Duration(milliseconds: 1), () {
          if (!value.isLoading &&
              !value.isSuccess &&
              !value.isEmailMobileError) {
            Future.delayed(
                const Duration(milliseconds: 1100), () => value.reset());
            Future.delayed(const Duration(milliseconds: 1000),
                () => Navigator.of(context).pop());
          }
          if (!value.isLoading &&
              value.isSuccess &&
              !value.isEmailMobileError) {
            Future.delayed(const Duration(milliseconds: 1000), () {
              Navigator.of(context).pop();
              value.reset();
            });
          }
          if (value.isSuccessValidation) {
            forgotPasswordDialog(context);
          }
          if (value.isEmailMobileError) {
            Future.delayed(const Duration(milliseconds: 2000), () {
              value.reset();
            });
          }
        });
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          layoutBuilder: (widget, animation) {
            return FadeInAnimation(
              duration: const Duration(milliseconds: 800),
              child: widget!,
              delay: const Duration(milliseconds: 1000),
            );
          },
          child: value.otpView
              ? child!
              : Column(
                  children: [
                    const SizedBox(height: 5),
                    Image.asset(
                      'assets/images/AQ_PRIME_LOGO_2.png',
                      height: 130,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'We\'ll help you get to your account! Please let us know which email address you are using:',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: HexColor('#747474'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    RegistraionInputField(
                      isError: value.isEmailMobileError,
                      errorMessage: value.message ?? 'email ba talaga \'yan?',
                      name: 'Email / Mobile Number',
                      controller: emailNumber,
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 3),
                    ),
                    const SizedBox(height: 25),
                    PrimaryButton(
                      label: 'Submit OTP',
                      width: double.infinity,
                      height: 50,
                      action: () {
                        value.forgotPasswordAPI(emailNumber.text);
                      },
                    ),
                    const SizedBox(height: 30),
                    TextAndLink(
                      text: 'Want to sign in?',
                      link: 'Sign in here',
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
        );
      },
    );
  }

  forgotPasswordDialog(context) {
    showGeneralDialog(
      barrierDismissible: false,
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;

        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: anim1.value,
            child: AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              contentPadding: const EdgeInsets.all(15),
              actionsPadding: const EdgeInsets.only(bottom: 10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              backgroundColor: Colors.black87,
              content: AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.transparent,
                child: Consumer<ForgotPasswordProvider>(
                    builder: (context, value, child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          value.message ?? 'Please Wait...',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      !value.isSuccess & value.isLoading
                          ? SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                color: Colors.red,
                                strokeWidth: 2.5,
                              ),
                            )
                          : SizedBox(
                              width: 25,
                              height: 25,
                              child: Icon(
                                value.message ==
                                        'One time password successfully generated.'
                                    ? Icons.check
                                    : Icons.close,
                                color: Colors.red,
                              ),
                            ),
                    ],
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
