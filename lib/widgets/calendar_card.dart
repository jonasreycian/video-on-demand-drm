import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/utilities/hex_color.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// ignore: must_be_immutable
class CalendarField extends StatelessWidget {
  CalendarField({
    this.isDateRange = false,
    this.margin,
    this.withShadow = false,
    this.function,
    this.selectedDate,
    Key? key,
  }) : super(key: key);
  final bool isDateRange;
  String? selectedDate;
  EdgeInsets? margin;
  bool withShadow;
  void Function()? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 55,
        margin: margin == null ? const EdgeInsets.all(0) : margin!,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 25),
        decoration: BoxDecoration(
          color: HexColor('#F9FAFB'),
          borderRadius: BorderRadius.circular(15),
          boxShadow: withShadow
              ? [
                  const BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1,
                    offset: Offset(1, 2), // Shadow position
                  ),
                ]
              : [],
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
              const SizedBox(width: 20),
              Text(
                selectedDate == null ? 'Birth Date' : selectedDate!,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: HexColor('#9D9D9D'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// dateRangePicker(BuildContext context, Function(Object?) onSubmit, DateTimeRange dateRange) {
//   showGeneralDialog(
//     barrierDismissible: false,
//     context: context,
//     pageBuilder: (context, animation1, animation2) {
//       return const SizedBox();
//     },
//     transitionBuilder: (context, anim1, anim2, child) {
//       final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;

//       return Transform(
//         transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
//         child: Opacity(
//           opacity: anim1.value,
//           child: AlertDialog(
//             actionsAlignment: MainAxisAlignment.center,
//             contentPadding: const EdgeInsets.all(10),
//             actionsPadding: const EdgeInsets.only(bottom: 10),
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(20.0),
//               ),
//             ),
//             backgroundColor: Colors.white,
//             content: AnimatedContainer(
//               duration: const Duration(milliseconds: 50),
//               width: MediaQuery.of(context).size.width,
//               height: 350,
//               color: Colors.white,
//               child: SfDateRangePicker(
//                 showTodayButton: true,
//                 selectionMode: DateRangePickerSelectionMode.range,
//                 showActionButtons: true,
//                 minDate: DateTime.now().subtract(const Duration(days: 365)),
//                 maxDate: DateTime.now(),
//                 rangeSelectionColor: HexColor('#FF715B'),
//                 startRangeSelectionColor: HexColor('#006B83'),
//                 endRangeSelectionColor: HexColor('#006B83'),
//                 initialSelectedRange: PickerDateRange(dateRange.start, dateRange.end),
//                 todayHighlightColor: HexColor('#006B83'),
//                 onSubmit: onSubmit,
//                 onCancel: () => Navigator.pop(context),
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
