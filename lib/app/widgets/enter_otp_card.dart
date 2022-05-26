import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/app/widgets/secondary_button.dart';
import 'package:aq_prime/device/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OtpView extends StatelessWidget {
  OtpView({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
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
            strokeColorBuilder: PinListenColorBuilder(Colors.blue, Colors.red),
            bgColorBuilder: PinListenColorBuilder(Colors.white, Colors.white),
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
          onSubmit: (pin) {
            debugPrint('submit pin:$pin');
          },
          enableInteractiveSelection: false,
        ),
        const SizedBox(height: 40),
        PrimaryButton(
          isDisabled: true,
          label: 'Submit OTP',
          width: double.infinity,
          height: 50,
          action: () {
            if (controller.text.isNotEmpty) {
              print(controller.text);
              focusNode.unfocus();
            } else {
              generalDialog(
                context: context,
                message: 'Please Enter OTP.',
                isAutoClose: true,
                isLoading: false,
              );
            }
          },
        ),
        const SizedBox(height: 70),
        SendItAgainCard(),
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
    return Column(
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
    );
  }
}
