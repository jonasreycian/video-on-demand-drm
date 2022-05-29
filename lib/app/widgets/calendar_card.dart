import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalendarField extends StatelessWidget {
  CalendarField({
    this.isDateRange = false,
    this.margin = const EdgeInsets.all(0),
    this.withShadow = false,
    this.function,
    this.selectedDate,
    this.border,
    Key? key,
  }) : super(key: key);
  final bool isDateRange;
  String? selectedDate;
  EdgeInsets? margin;
  bool withShadow;
  void Function()? function;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 50,
        margin: margin,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          border: border,
          color: HexColor('#F9FAFB'),
          borderRadius: BorderRadius.circular(5),
          boxShadow: withShadow
              ? [
                  const BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1,
                    offset: Offset(1, 2),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/calendar.png',
                width: 20,
                height: 20,
                color: HexColor('#BEBBBB'),
              ),
              const SizedBox(width: 8),
              Text(
                selectedDate == null ? 'Birth Date' : selectedDate!,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color:
                      selectedDate == null ? HexColor('#9D9D9D') : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
