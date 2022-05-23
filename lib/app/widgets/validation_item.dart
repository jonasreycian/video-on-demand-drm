import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';

class ValidationItem extends StatelessWidget {
  const ValidationItem({
    required this.name,
    required this.isSuccess,
    this.isBlurred = false,
    Key? key,
  }) : super(key: key);
  final String name;
  final bool isSuccess;
  final bool isBlurred;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isBlurred ? 0.1 : 1.0,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: isSuccess ? Colors.red : Colors.transparent,
              border: isSuccess
                  ? Border.all(color: Colors.transparent)
                  : Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Icon(
                Icons.check,
                color: isSuccess ? Colors.white : Colors.red,
                size: 20,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: isSuccess ? Colors.red : HexColor('#ADA7A7'),
            ),
          ),
        ],
      ),
    );
  }
}
