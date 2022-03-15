import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/registration_provider.dart';
import 'package:flutter_netflix_responsive_ui/widgets/input_textfield.dart';
import 'package:flutter_netflix_responsive_ui/widgets/primary_button.dart';
import 'package:provider/provider.dart';

class Registration extends StatelessWidget {
  Registration({Key? key}) : super(key: key);
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 750,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Consumer<RegistrationProvider>(builder: (context, value, child) {
                return Column(
                  children: [
                    Image.asset(
                      'assets/images/netflixLogo.png',
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(height: 25),
                    InputTextField(
                      controller: firstName,
                      hintText: 'First Name',
                      height: 55,
                      keyboardType: TextInputType.text,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                      controller: lastName,
                      hintText: 'Last Name',
                      height: 55,
                      keyboardType: TextInputType.text,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                      controller: email,
                      hintText: 'E-mail',
                      height: 55,
                      keyboardType: TextInputType.text,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                      controller: mobileNumber,
                      hintText: 'Mobile Number',
                      height: 55,
                      keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      prefixIconPadding: const EdgeInsets.only(top: 10, right: 0, left: 0),
                      prefixIcon: GestureDetector(
                        onTap: () => countryCodeDialog(context: context),
                        child: Text(value.countryCode),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                      controller: password,
                      hintText: 'Password',
                      height: 55,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                      controller: confirmPassword,
                      hintText: 'Confirm Password',
                      height: 55,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      height: 50,
                      action: () {
                        // emailFocus.unfocus();
                        // passwordFocus.unfocus();
                        // dialog(context: context);
                        // data.loadData(email.text, password.text);
                      },
                      width: double.infinity,
                      label: 'Register',
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
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
              contentPadding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
              actionsPadding: const EdgeInsets.only(bottom: 10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              backgroundColor: Colors.white,
              content: AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Colors.white,
                child: CountryCodePicker(
                  onChanged: (value) {
                    Provider.of<RegistrationProvider>(context, listen: false).setCountryCode(value);
                    Navigator.of(context).pop();
                  },
                  initialSelection: 'PH',
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  alignLeft: false,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
