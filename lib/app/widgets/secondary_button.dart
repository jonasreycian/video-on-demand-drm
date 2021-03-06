import 'package:flutter/material.dart';

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
    this.image,
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
  final Widget? image;
  EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding ??= const EdgeInsets.all(0),
      height: height,
      width: width == null ? double.infinity : width!,
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1.0,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
          ),
          child: Stack(
            children: [
              Visibility(
                visible: image != null,
                child: Container(
                  margin: const EdgeInsets.only(left: 58),
                  child: image!,
                ),
              ),
              Center(
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
