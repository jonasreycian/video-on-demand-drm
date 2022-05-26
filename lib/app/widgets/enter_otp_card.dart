import 'package:aq_prime/app/providers/forgot_password_provider.dart';
import 'package:aq_prime/app/providers/otp_provider.dart';
import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

class OtpView extends StatelessWidget {
  OtpView({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Consumer<OtpProvider>(builder: (context, value, _) {
      controller.text = value.pin;
      Future.delayed(const Duration(milliseconds: 1), () {
        if (!value.isLoading && value.isSuccess) {
          Future.delayed(
              const Duration(milliseconds: 1000),
              () => Provider.of<ForgotPasswordProvider>(context, listen: false)
                  .setOtpView());
        }
      });
      return Column(
        children: [
          const SizedBox(height: 5),
          Image.asset(
            'assets/images/AQ_PRIME_LOGO_2.png',
            height: 130,
            width: double.infinity,
          ),
          const SizedBox(height: 40),
          PinInputTextField(
            pinLength: 4,
            decoration: BoxLooseDecoration(
              radius: Radius.zero,
              strokeColorBuilder: value.isError
                  ? PinListenColorBuilder(
                      HexColor('#D4030B'), HexColor('#D4030B'))
                  : PinListenColorBuilder(Colors.blue, Colors.white),
              bgColorBuilder: value.isError
                  ? PinListenColorBuilder(Colors.red.shade100, Colors.white)
                  : PinListenColorBuilder(Colors.white, Colors.white),
              textStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            controller: controller,
            focusNode: focusNode,
            textInputAction: TextInputAction.go,
            enabled: true,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.characters,
            onChanged: (pin) => value.onChange(pin),
            enableInteractiveSelection: false,
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            isDisabled: !value.isPinComplete,
            trailing: value.isLoading
                ? CircularProgressIndicator(
                    backgroundColor: Colors.red,
                    color: Colors.white,
                  )
                : const SizedBox(),
            label: 'Submit OTP',
            width: double.infinity,
            height: 50,
            action: () {
              value.onSubmit(
                  Provider.of<ForgotPasswordProvider>(context, listen: false)
                      .successEmailMobile,
                  controller.text);
              focusNode.unfocus();
            },
          ),
          const SizedBox(height: 15),
          ErrorMessage(
            message: value.message,
          ),
          const SizedBox(height: 50),
          SendItAgainCard(),
        ],
      );
    });
  }
}

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    this.message,
    Key? key,
  }) : super(key: key);
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        message != null
            ? Text(
                message!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                  fontSize: 16,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class SendItAgainCard extends StatelessWidget {
  const SendItAgainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            'Didn\'t receive an OTP?',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Send it Again',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w400,
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
