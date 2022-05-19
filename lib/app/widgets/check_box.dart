import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';

class CheckboxLabel extends StatelessWidget {
  const CheckboxLabel({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.0,
              width: 50.0,
              child: Checkbox(
                value: value,
                activeColor: HexColor("#006B83"),
                onChanged: (bool? newValue) {
                  onChanged(newValue);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
