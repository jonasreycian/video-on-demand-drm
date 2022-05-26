import 'package:aq_prime/app/widgets/calendar_card.dart';
import 'package:aq_prime/app/widgets/input_textfield.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';

class RegistraionInputField extends StatelessWidget {
  const RegistraionInputField({
    Key? key,
    required this.isError,
    required this.name,
    required this.errorMessage,
    required this.controller,
    this.padding,
  }) : super(key: key);
  final String name;
  final String errorMessage;
  final bool isError;
  final TextEditingController controller;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        InputTextField(
          border: isError
              ? Border.all(
                  color: Colors.red,
                  width: 1,
                )
              : null,
          controller: controller,
          hintText: '',
          height: 55,
          keyboardType: TextInputType.text,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          padding:
              padding ?? const EdgeInsets.only(left: 60, top: 10, bottom: 10),
        ),
        const SizedBox(height: 5),
        isError
            ? Text(
                errorMessage,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: HexColor('#FF8A00'),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class RegistraionInputFieldPassword extends StatelessWidget {
  const RegistraionInputFieldPassword({
    Key? key,
    required this.isError,
    required this.name,
    required this.errorMessage,
    required this.controller,
    required this.onPressed,
    required this.isObscureText,
  }) : super(key: key);
  final String name;
  final String errorMessage;
  final bool isError;
  final bool isObscureText;
  final TextEditingController controller;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        InputTextField(
          controller: controller,
          hintText: '',
          height: 55,
          keyboardType: TextInputType.text,
          obscureText: isObscureText,
          border: isError
              ? Border.all(
                  color: Colors.red,
                  width: 1,
                )
              : null,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
          suffixIconPadding:
              const EdgeInsets.only(top: 3, bottom: 10, right: 10),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              isObscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: HexColor('#BEBBBB'),
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 5),
        isError
            ? Text(
                errorMessage,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: HexColor('#FF8A00'),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class BirthDate extends StatelessWidget {
  const BirthDate({
    required this.isError,
    required this.errorMessage,
    required this.function,
    required this.selectedDate,
    Key? key,
  }) : super(key: key);
  final void Function() function;
  final String? selectedDate;
  final bool isError;
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Birth Date',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        CalendarField(
          selectedDate: selectedDate,
          withShadow: true,
          isDateRange: false,
          function: function,
          border: isError
              ? Border.all(
                  color: Colors.red,
                  width: 1,
                )
              : null,
        ),
        const SizedBox(height: 5),
        isError
            ? Text(
                errorMessage,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: HexColor('#FF8A00'),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class RegistraionInputFieldMobileNumber extends StatelessWidget {
  const RegistraionInputFieldMobileNumber({
    Key? key,
    required this.isError,
    required this.name,
    required this.errorMessage,
    required this.countryCode,
    required this.controller,
    required this.onPressed,
    required this.isObscureText,
  }) : super(key: key);
  final String name;
  final String errorMessage;
  final bool isError;
  final bool isObscureText;
  final String countryCode;
  final TextEditingController controller;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        InputTextField(
          controller: controller,
          hintText: '',
          height: 55,
          border: isError
              ? Border.all(
                  color: Colors.red,
                  width: 1,
                )
              : null,
          keyboardType: TextInputType.number,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
          prefixIconPadding: const EdgeInsets.only(top: 8, bottom: 10),
          prefixIcon: GestureDetector(
            onTap: onPressed,
            child: Text(
              countryCode,
              style: TextStyle(
                  fontSize: 15,
                  color: HexColor('#BEBBBB'),
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(height: 5),
        isError
            ? Text(
                errorMessage,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: HexColor('#FF8A00'),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
