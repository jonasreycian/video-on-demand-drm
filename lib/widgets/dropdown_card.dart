import 'package:flutter/material.dart';
import 'package:aq_prime/utilities/hex_color.dart';

// ignore: must_be_immutable
class Dropdown extends StatefulWidget {
  Dropdown({
    required this.choices,
    required this.hint,
    required this.onChanged,
    this.width,
    this.height,
    this.padding,
    this.textHintColor,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final List<String> choices;
  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  Color? textHintColor;
  String hint;
  Color? backgroundColor;
  final void Function(String?) onChanged;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ??= 50,
      width: widget.width ??= double.infinity,
      padding: widget.padding ??= const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: widget.backgroundColor == null ? HexColor('#F9FAFB') : widget.backgroundColor!,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton<String>(
        menuMaxHeight: 350,
        dropdownColor: Colors.white,
        underline: Container(),
        isDense: true,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.red,
          size: 25,
        ),
        hint: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            widget.hint,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: widget.textHintColor,
            ),
          ),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        items: <String>[...widget.choices].map(
          (String value) {
            return DropdownMenuItem<String>(
              // alignment: Alignment.centerLeft,
              value: value,
              child: Text(
                value,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: widget.hint == value ? FontWeight.w700 : FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: widget.hint != value ? Colors.black : Colors.red,
                ),
              ),
            );
          },
        ).toList(),
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: HexColor('#BEBBBB'),
        ),
        isExpanded: true,
        onChanged: widget.onChanged,
      ),
    );
  }
}
