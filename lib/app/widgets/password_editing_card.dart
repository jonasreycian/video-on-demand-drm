import 'package:aq_prime/app/providers/change_password_provider.dart';
import 'package:aq_prime/app/widgets/input_textfield.dart';
import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/app/widgets/validation_item.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class PasswordEditingCard extends StatelessWidget {
  PasswordEditingCard({
    Key? key,
  }) : super(key: key);
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final GlobalKey expansionTileKey1 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 100,
          child: AnimatedContainer(
            margin: const EdgeInsets.only(top: 25, bottom: 5, left: 25, right: 25),
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Consumer<ChangePasswordMyAccount>(builder: (context, value, child) {
              Future.delayed(const Duration(milliseconds: 1000), () {
                if (value.isSuccess) {
                  Navigator.of(context).pop();
                  value.reset();
                  password.clear();
                  confirmPassword.clear();
                }
              });
              return Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  key: expansionTileKey1,
                  childrenPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 0),
                  tilePadding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  expandedAlignment: Alignment.centerLeft,
                  onExpansionChanged: (value) {
                    if (value) {
                      _scrollToSelectedContent(expansionTileKey: expansionTileKey1);
                    }
                  },
                  trailing: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 100),
                    child: Icon(Icons.arrow_drop_down, color: Colors.white),
                  ),
                  title: Text(
                    'Change Password',
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  children: [
                    Divider(
                      color: Colors.red,
                      thickness: 1.5,
                    ),
                    const SizedBox(height: 15),
                    InputTextField(
                      onChanged: (p0) => value.setPassword(p0),
                      controller: password,
                      hintText: 'Password',
                      height: 50,
                      keyboardType: TextInputType.text,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      padding: const EdgeInsets.only(left: 20, top: 7, bottom: 10),
                      suffixIconPadding: const EdgeInsets.only(top: 1, bottom: 10, right: 10),
                      obscureText: value.passwordHidden,
                      suffixIcon: IconButton(
                        onPressed: () => value.setPasswordHidden(),
                        icon: Icon(
                          value.passwordHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: HexColor('#BEBBBB'),
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ValidationItem(isSuccess: value.eightChar, name: 'Minimum eight characters'),
                    const SizedBox(height: 15),
                    ValidationItem(isSuccess: value.oneNumber, name: 'At least one number'),
                    const SizedBox(height: 15),
                    ValidationItem(isSuccess: value.oneLower, name: 'At least one lower case'),
                    const SizedBox(height: 15),
                    ValidationItem(isSuccess: value.oneUpper, name: 'At least one upper case'),
                    const SizedBox(height: 15),
                    InputTextField(
                      isEnabled: value.allSuccess,
                      onChanged: (p0) => value.setConfirmPassword(p0),
                      controller: confirmPassword,
                      hintText: 'Confirm Password',
                      height: 50,
                      keyboardType: TextInputType.text,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      padding: const EdgeInsets.only(left: 20, top: 7, bottom: 10),
                      suffixIconPadding: const EdgeInsets.only(top: 1, bottom: 10, right: 10),
                      obscureText: value.passwordConfirmHidden,
                      suffixIcon: IconButton(
                        onPressed: () => value.setPasswordConfirmHidden(),
                        icon: Icon(
                          value.passwordConfirmHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: HexColor('#BEBBBB'),
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ValidationItem(isSuccess: value.isPasswordMatch, isBlurred: !value.allSuccess, name: 'Password Matched'),
                    const SizedBox(height: 15),
                    PrimaryButton(
                      isDisabled: !value.isPasswordMatch,
                      height: 50,
                      width: double.infinity,
                      label: 'Save',
                      action: () {
                        changePasswordDialog(context);
                        value.resetPassword(password.text, confirmPassword.text);
                      },
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  _scrollToSelectedContent({required GlobalKey expansionTileKey}) {
    final keyContext = expansionTileKey.currentContext;
    if (keyContext != null) {
      Future.delayed(Duration(milliseconds: 250)).then((value) {
        Scrollable.ensureVisible(keyContext, duration: Duration(milliseconds: 250));
      });
    }
  }

  changePasswordDialog(context) {
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
                child: Consumer<ChangePasswordMyAccount>(builder: (context, value, child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          value.message ?? 'Please Wait...',
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
                      !value.isSuccess
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
                                Icons.check,
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
