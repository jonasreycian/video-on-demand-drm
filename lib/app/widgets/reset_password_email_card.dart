import 'package:aq_prime/app/providers/forgot_password_provider.dart';
import 'package:aq_prime/app/widgets/dropdown_card.dart';
import 'package:aq_prime/app/widgets/input_textfield.dart';
import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordCardEmail extends StatelessWidget {
  ResetPasswordCardEmail({
    Key? key,
  }) : super(key: key);
  // final TextEditingController password = TextEditingController(text: 'Password1');
  // final TextEditingController confirmPassword = TextEditingController(text: 'Password1');
  // final TextEditingController emailNumber = TextEditingController(text: 'jesther11@yahoo.com');
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController emailNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordProvider>(builder: (context, value, child) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (!value.isLoading && !value.isSuccess) {
          Navigator.of(context).pop();
          password.clear();
          confirmPassword.clear();
          emailNumber.clear();
          Future.delayed(const Duration(milliseconds: 200), () => value.reset());
        }
      });
      return Column(
        children: [
          Image.asset(
            'assets/images/AQ_PRIME_LOGO_2.png',
            height: 130,
            width: double.infinity,
          ),
          const SizedBox(height: 25),
          Dropdown(
            width: double.infinity,
            height: 45,
            hint: 'Reset via Email',
            choices: value.choices,
            textHintColor: Colors.black,
            onChanged: (selectedChoice) {},
          ),
          const SizedBox(height: 20),
          InputTextField(
            controller: emailNumber,
            hintText: 'Email',
            height: 55,
            keyboardType: TextInputType.emailAddress,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
          ),
          const SizedBox(height: 20),
          InputTextField(
            controller: password,
            hintText: 'Password',
            height: 55,
            keyboardType: TextInputType.text,
            obscureText: value.isObscure,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
            suffixIconPadding: const EdgeInsets.only(top: 3, bottom: 10, right: 10),
            suffixIcon: IconButton(
              onPressed: () => value.setIsObscure(),
              icon: Icon(
                value.isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: HexColor('#BEBBBB'),
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          InputTextField(
            controller: confirmPassword,
            hintText: 'Confirm Password',
            height: 55,
            keyboardType: TextInputType.text,
            obscureText: value.isObscureConfirm,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            suffixIconPadding: const EdgeInsets.only(top: 3, bottom: 10, right: 10),
            suffixIcon: IconButton(
              onPressed: () => value.setIsObscureConfirm(),
              icon: Icon(
                value.isObscureConfirm ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: HexColor('#BEBBBB'),
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            label: 'Reset',
            width: double.infinity,
            height: 50,
            action: () {
              forgotPasswordDialog(context);
              value.sendEmailOrNumber(emailNumber.text, password.text, confirmPassword.text);
            },
          ),
        ],
      );
    });
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
                child: Consumer<ForgotPasswordProvider>(builder: (context, value, child) {
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
                                value.message == 'Successfully password reset.' ? Icons.check : Icons.close,
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
