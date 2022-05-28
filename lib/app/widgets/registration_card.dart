import 'package:aq_prime/app/providers/registration_provider.dart';
import 'package:aq_prime/app/widgets/check_box.dart';
import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/app/widgets/registration_input_field.dart';
import 'package:aq_prime/device/utils/dialog.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationCard extends StatelessWidget {
  RegistrationCard({Key? key}) : super(key: key);
  // final TextEditingController firstName = TextEditingController(text: 'Juan');
  // final TextEditingController lastName =
  //     TextEditingController(text: 'Dela Cruz');
  // final TextEditingController email =
  //     TextEditingController(text: 'juanDela_crus@gmail.com');
  // final TextEditingController mobileNumber =
  //     TextEditingController(text: '9760223075');
  // final TextEditingController password =
  //     TextEditingController(text: 'passwordMatch');
  // final TextEditingController confirmPassword =
  //     TextEditingController(text: 'passwordMatch');
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
      builder: (context, value, child) {
        Future.delayed(const Duration(milliseconds: 100), () {
          if (!value.isLoading && !value.isSuccess) {
            Future.delayed(
              const Duration(seconds: 2),
              (() => value.reset()),
            );
          }
          if (value.isValidationComplete) {
            registrationDialog(context);
            Future.delayed(
              const Duration(seconds: 2),
              (() {
                Navigator.of(context).pop();
                Future.delayed(
                  const Duration(milliseconds: 100),
                  () => value.reset(),
                );
              }),
            );
          }
          if (!value.isLoading && value.isSuccess) {
            registrationDialog(context);
            Future.delayed(
              const Duration(milliseconds: 100),
              (() => value.reset()),
            );
            Navigator.of(context)
              ..pop()
              ..pop();
          }
        });
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Image.asset(
                'assets/images/AQ_PRIME_LOGO_2.png',
                height: 130,
                width: double.infinity,
              ),
              const SizedBox(height: 16),
              RegistraionInputField(
                isError: value.firstNameError,
                errorMessage: value.message ?? '',
                name: 'First Name',
                controller: firstName,
              ),
              const SizedBox(height: 16),
              RegistraionInputField(
                isError: value.lastNameError,
                errorMessage: value.message ?? '',
                name: 'Last Name',
                controller: lastName,
              ),
              const SizedBox(height: 16),
              RegistraionInputField(
                isError: value.emailError,
                errorMessage: value.message ?? '',
                name: 'Email address',
                controller: email,
              ),
              const SizedBox(height: 16),
              BirthDate(
                isError: value.birthDayError,
                errorMessage: value.message ?? '',
                selectedDate: value.birthDayString,
                function: () => calendarDialog(
                  context,
                  DateTime.now(),
                  (p0) {
                    Navigator.of(context).pop();
                    value.setBirthDay(p0);
                  },
                ),
              ),
              const SizedBox(height: 16),
              RegistraionInputFieldMobileNumber(
                countryCode: value.countryCode.toString(),
                isObscureText: value.isObscurePassword,
                onPressed: () => countryCodeDialog(context: context),
                isError: value.mobileError,
                errorMessage: value.message ?? '',
                name: 'Mobile Number',
                controller: mobileNumber,
              ),
              const SizedBox(height: 16),
              RegistraionInputFieldPassword(
                isObscureText: value.isObscurePassword,
                onPressed: () => value.setIsObscurePassword(),
                isError: value.passwordError,
                errorMessage: value.message ?? '',
                name: 'Password',
                controller: password,
              ),
              const SizedBox(height: 16),
              RegistraionInputFieldPassword(
                isObscureText: value.isObscureConfirmPassword,
                onPressed: () => value.setIsObscureConfirmPassword(),
                isError: value.confirmPasswordError,
                errorMessage: value.message ?? '',
                name: 'Confirm Password',
                controller: confirmPassword,
              ),
              const SizedBox(height: 20),
              CheckboxLabel(
                label: 'Accept Terms and Condition',
                value: value.isAcceptedTermsAndCondition,
                onChanged: () => value.setTermsAndCondition(),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                isDisabled: !value.isAcceptedTermsAndCondition,
                height: 50,
                width: double.infinity,
                label: 'Register',
                action: () {
                  value.sendAPI(
                    firstName.text,
                    lastName.text,
                    mobileNumber.text,
                    email.text,
                    password.text,
                    confirmPassword.text,
                  );
                },
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
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  registrationDialog(context) {
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
                child: Consumer<RegistrationProvider>(
                    builder: (context, value, child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          value.message ?? 'Registering, Please wait...',
                          textAlign: TextAlign.center,
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
                      value.isLoading || value.isSuccess
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
                                Icons.close,
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
                        Provider.of<RegistrationProvider>(context,
                                listen: false)
                            .setCountryCode(value);
                        Navigator.of(context).pop();
                      },
                      initialSelection: Provider.of<RegistrationProvider>(
                              context,
                              listen: false)
                          .countryCode
                          .code,
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
                      dialogSize:
                          Size(MediaQuery.of(context).size.width - 40, 350),
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
