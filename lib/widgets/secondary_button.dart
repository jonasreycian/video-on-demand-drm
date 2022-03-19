import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/utilities/hex_color.dart';

// ignore: must_be_immutable
class SecondaryButton extends StatelessWidget {
  SecondaryButton({
    required this.label,
    required this.height,
    this.width,
    required this.action,
    this.isDisabled = false,
    this.fontColor = Colors.black,
    this.fontSize = 16,
    this.image = '',
    this.padding,
    Key? key,
  }) : super(key: key);

  final String label;
  final double height;
  double? width;
  final Function action;
  final bool isDisabled;
  final Color fontColor;
  final double fontSize;
  final String image;
  EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding ??= const EdgeInsets.all(0),
      height: height,
      width: width == null ? double.infinity : width!,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1.0,
        child: ElevatedButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                width: 1.5,
                color: Colors.red,
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: (image != ''),
                child: Image.asset(
                  image,
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(width: 2),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: fontColor,
                  ),
                ),
              ),
            ],
          ),
          onPressed: isDisabled ? null : () => action(),
        ),
      ),
    );
  }
}
