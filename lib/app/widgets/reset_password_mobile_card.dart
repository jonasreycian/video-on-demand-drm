// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../device/utils/dialog.dart';
// import '../providers/forgot_password_provider.dart';
// import 'dropdown_card.dart';
// import 'input_textfield.dart';
// import 'primary_button.dart';

// class ResetPasswordCardMobile extends StatelessWidget {
//   ResetPasswordCardMobile({
//     Key? key,
//   }) : super(key: key);

//   final TextEditingController emailNumber = TextEditingController();
//   final FocusNode emailNumberFocus = FocusNode();
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ForgotPasswordProvider>(builder: (context, value, child) {
//       Future.delayed(const Duration(milliseconds: 100), () {
//         if (!value.isLoading && !value.isSuccess) {
//           generalDialog(
//               context: context,
//               message: value.message ?? '',
//               isAutoClose: true,
//               isLoading: value.isSuccess);
//           value.reset();
//         }
//       });
//       // Future.delayed(const Duration(milliseconds: 2000), () {
//       //   if (value.isSuccess) {
//       //     print('success');
//       //     // Navigator.of(context).pushReplacementNamed(NavScreen.routeName);
//       //     value.reset();
//       //   }
//       // });
//       return Column(
//         children: [
//           Image.asset(
//             'assets/images/AQ_PRIME_LOGO_2.png',
//             height: 130,
//             width: double.infinity,
//           ),
//           const SizedBox(height: 25),
//           Dropdown(
//             width: double.infinity,
//             height: 45,
//             hint: 'dummy hint',
//             choices: value.choices,
//             textHintColor: Colors.black,
//             onChanged: (selectedChoice) {},
//           ),
//           const SizedBox(height: 20),
//           InputTextField(
//             focusNode: emailNumberFocus,
//             controller: emailNumber,
//             hintText: 'Mobile number',
//             height: 55,
//             keyboardType: TextInputType.emailAddress,
//             floatingLabelBehavior: FloatingLabelBehavior.auto,
//             padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
//             prefixIconPadding: const EdgeInsets.only(top: 8, bottom: 10),
//             prefixIcon: GestureDetector(
//               onTap: () => countryCodeDialog(context: context),
//               child: Text(value.countryCode.dialCode.toString(),
//                   style: TextStyle(fontSize: 15, color: Colors.black)),
//             ),
//           ),
//           const SizedBox(height: 20),
//           PrimaryButton(
//             label: 'Send OTP',
//             width: double.infinity,
//             height: 50,
//             action: () {
//               if (emailNumber.text.isNotEmpty) {
//                 value.sendEmailOrNumber('d', '', '');
//                 emailNumberFocus.unfocus();
//                 generalDialog(
//                   context: context,
//                   message: value.message ?? '',
//                   isAutoClose: true,
//                   isLoading: true,
//                 );
//               } else {
//                 generalDialog(
//                   context: context,
//                   message: 'Please Enter Mobile Number',
//                   isAutoClose: true,
//                   isLoading: false,
//                 );
//               }
//             },
//           ),
//         ],
//       );
//     });
//   }

//   countryCodeDialog({required BuildContext context}) {
//     // Future.delayed(const Duration(milliseconds: 2000), () => Navigator.of(context).pop());
//     showGeneralDialog(
//       barrierDismissible: false,
//       context: context,
//       pageBuilder: (context, animation1, animation2) => const SizedBox(),
//       transitionBuilder: (context, anim1, anim2, child) {
//         final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;

//         return Transform(
//           transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
//           child: Opacity(
//             opacity: anim1.value,
//             child: AlertDialog(
//               actionsAlignment: MainAxisAlignment.center,
//               contentPadding: const EdgeInsets.all(15),
//               actionsPadding: const EdgeInsets.only(bottom: 10),
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20.0),
//                 ),
//               ),
//               backgroundColor: Colors.black87,
//               content: AnimatedContainer(
//                 duration: const Duration(milliseconds: 50),
//                 width: MediaQuery.of(context).size.width,
//                 height: 100,
//                 color: Colors.transparent,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Please Select Country Code',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w400,
//                         fontStyle: FontStyle.normal,
//                         fontSize: 15,
//                         color: Colors.white,
//                       ),
//                     ),
//                     CountryCodePicker(
//                       onChanged: (value) {
//                         Provider.of<ForgotPasswordProvider>(context,
//                                 listen: false)
//                             .setCountryCode(value);
//                         Navigator.of(context).pop();
//                       },
//                       initialSelection: Provider.of<ForgotPasswordProvider>(
//                               context,
//                               listen: false)
//                           .countryCode
//                           .code,
//                       favorite: ['PH', 'US'],
//                       showCountryOnly: false,
//                       hideSearch: true,
//                       showOnlyCountryWhenClosed: true,
//                       alignLeft: true,
//                       showDropDownButton: true,
//                       backgroundColor: Colors.transparent,
//                       barrierColor: Colors.transparent,
//                       textStyle: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w400,
//                         fontStyle: FontStyle.normal,
//                         fontSize: 15,
//                         color: Colors.white,
//                       ),
//                       dialogTextStyle: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w400,
//                         fontStyle: FontStyle.normal,
//                         fontSize: 15,
//                         color: Colors.white,
//                       ),
//                       boxDecoration: BoxDecoration(
//                         color: Colors.black87,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(15),
//                         ),
//                       ),
//                       dialogSize:
//                           Size(MediaQuery.of(context).size.width - 40, 350),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
