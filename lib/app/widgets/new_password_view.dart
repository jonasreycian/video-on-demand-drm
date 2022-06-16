import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../providers/forgot_password_provider.dart';
import 'enter_otp_card.dart';
import 'primary_button.dart';
import 'registration_input_field.dart';
import 'reset_password_provider.dart';

class NewPasswordView extends StatelessWidget {
  NewPasswordView({Key? key}) : super(key: key);
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordProvider>(
        child: Image.asset(
          'assets/images/AQ_PRIME_LOGO_2.png',
          height: 130,
          width: double.infinity,
        ),
        builder: (context, value, child) {
          Future.delayed(const Duration(seconds: 5), () {
            if (value.status == ApiResponse.success) {
              Provider.of<ForgotPasswordProvider>(context, listen: false)
                  .setOtpView(CurrentView.emailInput);
            }
          });

          return AnimationConfiguration.staggeredList(
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
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  child!,
                  const SizedBox(height: 40),
                  RegistraionInputFieldPassword(
                    isObscureText: value.isPasswordObscure,
                    onPressed: () => value.setPasswordObscure(),
                    isError: value.passwordError,
                    errorMessage: ((value.status != ApiResponse.success) &&
                            (value.status != ApiResponse.fail))
                        ? value.message ?? ''
                        : '',
                    name: 'Password',
                    controller: password,
                  ),
                  const SizedBox(height: 16),
                  RegistraionInputFieldPassword(
                    isObscureText: value.isConfirmPasswordObscure,
                    onPressed: () => value.setConfirmPasswordObscure(),
                    isError: value.confirmPassword,
                    errorMessage: ((value.status != ApiResponse.success) &&
                            (value.status != ApiResponse.fail))
                        ? value.message ?? ''
                        : '',
                    name: 'Confirm Password',
                    controller: confirmPassword,
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    // isDisabled: !value.isPinComplete,
                    trailing: value.status == ApiResponse.loading
                        ? CircularProgressIndicator(
                            backgroundColor: Colors.red,
                            color: Colors.white,
                          )
                        : const SizedBox(),
                    label: 'Reset Password',
                    width: double.infinity,
                    height: 50,
                    action: () {
                      value.onSubmit(
                        Provider.of<ForgotPasswordProvider>(context,
                                listen: false)
                            .successEmailMobile,
                        password.text,
                        confirmPassword.text,
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  ErrorMessage(
                    message: value.status == ApiResponse.success ||
                            value.status == ApiResponse.fail
                        ? value.message
                        : null,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
