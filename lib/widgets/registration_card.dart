import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/registration_provider.dart';
import 'package:flutter_netflix_responsive_ui/utilities/dialog.dart';
import 'package:flutter_netflix_responsive_ui/utilities/hex_color.dart';
import 'package:flutter_netflix_responsive_ui/widgets/calendar_card.dart';
import 'package:flutter_netflix_responsive_ui/widgets/input_textfield.dart';
import 'package:flutter_netflix_responsive_ui/widgets/primary_button.dart';
import 'package:provider/provider.dart';

class RegistrationCard extends StatelessWidget {
  RegistrationCard({Key? key}) : super(key: key);
  // final TextEditingController firstName = TextEditingController(text: 'Juan');
  // final TextEditingController lastName = TextEditingController(text: 'Dela Cruz');
  // final TextEditingController email = TextEditingController(text: 'juanDela_crus@gmail.com');
  // final TextEditingController mobileNumber = TextEditingController(text: '91643489');
  // final TextEditingController password = TextEditingController(text: 'passwordMatch');
  // final TextEditingController confirmPassword = TextEditingController(text: 'passwordMatch');
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(builder: (context, value, child) {
      firstName.text = value.getField('firstName');
      lastName.text = value.getField('lastName');
      email.text = value.getField('email');
      mobileNumber.text = value.getField('mobileNumber');
      password.text = value.getField('password');
      confirmPassword.text = value.getField('confirmPassword');
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!value.isLoading) {
          generalDialog(context: context, message: value.message, isAutoClose: true, isLoading: false);
        }
      });
      return Column(
        children: [
          Image.asset(
            'assets/images/SampleLogo.png',
            height: 130,
            width: 130,
          ),
          const SizedBox(height: 25),
          InputTextField(
            onChanged: (p0) => value.setField('firstName', p0),
            controller: firstName,
            hintText: 'First Name',
            height: 55,
            keyboardType: TextInputType.text,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
          ),
          const SizedBox(height: 20),
          InputTextField(
            onChanged: (p0) => value.setField('lastName', p0),
            controller: lastName,
            hintText: 'Last Name',
            height: 55,
            keyboardType: TextInputType.text,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
          ),
          const SizedBox(height: 20),
          InputTextField(
            onChanged: (p0) => value.setField('email', p0),
            controller: email,
            hintText: 'E-mail',
            height: 55,
            keyboardType: TextInputType.text,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
          ),
          const SizedBox(height: 20),
          CalendarField(
            selectedDate: value.birthDayString,
            withShadow: true,
            isDateRange: false,
            function: () => calendarDialog(
              context,
              DateTime.now(),
              (p0) {
                Navigator.of(context).pop();
                value.setBirthDay(p0);
              },
            ),
          ),
          const SizedBox(height: 20),
          InputTextField(
            onChanged: (p0) => value.setField('mobileNumber', p0),
            controller: mobileNumber,
            hintText: 'Mobile Number',
            height: 55,
            keyboardType: TextInputType.number,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            prefixIconPadding: const EdgeInsets.only(top: 8, bottom: 10),
            prefixIcon: GestureDetector(
              onTap: () => countryCodeDialog(context: context),
              child: Text(value.countryCode.dialCode.toString(), style: TextStyle(fontSize: 15, color: HexColor('#BEBBBB'), fontWeight: FontWeight.w700)),
            ),
          ),
          const SizedBox(height: 20),
          InputTextField(
            onChanged: (p0) => value.setField('password', p0),
            controller: password,
            hintText: 'Password',
            height: 55,
            keyboardType: TextInputType.text,
            obscureText: value.isObscurePassword,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            padding: const EdgeInsets.only(left: 60, top: 8, bottom: 8),
            suffixIconPadding: const EdgeInsets.only(top: 3, bottom: 10, right: 10),
            suffixIcon: IconButton(
              onPressed: () => value.setIsObscurePassword(),
              icon: Icon(
                value.isObscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: HexColor('#BEBBBB'),
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          InputTextField(
            onChanged: (p0) => value.setField('confirmPassword', p0),
            controller: confirmPassword,
            hintText: 'Confirm Password',
            height: 55,
            keyboardType: TextInputType.text,
            obscureText: value.isObscureConfirmPassword,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
            suffixIconPadding: const EdgeInsets.only(top: 3, bottom: 10, right: 10),
            suffixIcon: IconButton(
              onPressed: () => value.setIsObscureConfirmPassword(),
              icon: Icon(
                value.isObscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: HexColor('#BEBBBB'),
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            height: 50,
            action: () {
              if (firstName.text.isNotEmpty && lastName.text.isNotEmpty && email.text.isNotEmpty && mobileNumber.text.isNotEmpty && password.text.isNotEmpty && confirmPassword.text.isNotEmpty && value.birthDayString != null) {
                value.sendAPI(firstName.text, lastName.text, email.text, mobileNumber.text, password.text, confirmPassword.text);
                generalDialog(
                  context: context,
                  message: value.message,
                  isAutoClose: true,
                  isLoading: true,
                );
              } else {
                generalDialog(
                  context: context,
                  message: 'Please Fill-out all fields',
                  isAutoClose: true,
                  isLoading: false,
                );
              }
            },
            width: double.infinity,
            label: 'Register',
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already on AQ-Prime?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Text(
                  'Sign-in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  countryCodeDialog({required BuildContext context}) {
    // Future.delayed(const Duration(milliseconds: 2000), () => Navigator.of(context).pop());
    showGeneralDialog(
      barrierDismissible: false,
      context: context,
      pageBuilder: (context, animation1, animation2) => const SizedBox(),
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
                  Radius.circular(20.0),
                ),
              ),
              backgroundColor: Colors.black87,
              content: AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Please Select Country Code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    CountryCodePicker(
                      onChanged: (value) {
                        Provider.of<RegistrationProvider>(context, listen: false).setCountryCode(value);
                        Navigator.of(context).pop();
                      },
                      initialSelection: Provider.of<RegistrationProvider>(context, listen: false).countryCode.code,
                      favorite: ['PH', 'US'],
                      showCountryOnly: false,
                      hideSearch: true,
                      showOnlyCountryWhenClosed: true,
                      alignLeft: true,
                      showDropDownButton: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.transparent,
                      textStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      dialogTextStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      boxDecoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      dialogSize: Size(MediaQuery.of(context).size.width - 40, 350),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
