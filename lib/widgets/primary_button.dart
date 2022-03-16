import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/utilities/hex_color.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    required this.label,
    required this.height,
    this.width,
    required this.action,
    this.isDisabled = false,
    this.fontColor = Colors.white,
    this.fontSize = 16,
    this.image = '',
    this.margin,
    this.borderRadius,
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
  EdgeInsets? margin;
  double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??= const EdgeInsets.all(0),
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
                borderRadius: BorderRadius.circular(borderRadius == null ? 12.0 : borderRadius!),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 252, 5, 5),
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
                    fontWeight: FontWeight.w400,
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
