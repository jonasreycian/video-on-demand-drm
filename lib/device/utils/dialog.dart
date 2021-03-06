import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/providers/rating_provider.dart';
import '../../domain/entities/content.dart';

generalDialog({
  required BuildContext context,
  required String message,
  required bool isAutoClose,
  required bool isLoading,
  IconData? icon,
}) {
  if (isAutoClose) {
    Future.delayed(
        const Duration(milliseconds: 1500), () => Navigator.of(context).pop());
  }
  showGeneralDialog(
    barrierDismissible: false,
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return const SizedBox();
    },
    transitionBuilder: (context, anim1, anim2, child) {
      final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;

      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(
          opacity: anim1.value,
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            contentPadding: const EdgeInsets.all(15),
            actionsPadding: const EdgeInsets.only(bottom: 10),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            backgroundColor: Colors.black87,
            content: AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  isLoading
                      ? SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            color: Colors.red,
                            strokeWidth: 2.5,
                          ),
                        )
                      : SizedBox(
                          width: 25,
                          height: 25,
                          child: Icon(
                            icon ?? Icons.close,
                            color: Colors.red,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

calendarDialog(
    BuildContext context, DateTime? initialDate, Function(DateTime) onValue) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return const SizedBox();
    },
    transitionBuilder: (context, anim1, anim2, child) {
      final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(
          opacity: anim1.value,
          child: AlertDialog(
            shape:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
            content: SizedBox(
              height: 380,
              width: 450,
              child: CalendarDatePicker(
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                initialDate: initialDate ?? DateTime.now(),
                onDateChanged: onValue,
              ),
            ),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
    barrierDismissible: true,
    barrierLabel: '',
  );
}

ratingPopup({
  required BuildContext context,
  required bool? isThumbUp,
  required Content content,
  required RatingProvider provider,
  Function(Rate rate)? didRate,
}) {
  void handleCallback(Rate rate) {
    if (didRate == null) return;
    didRate(rate);
  }

  showGeneralDialog(
    barrierDismissible: false,
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return const SizedBox();
    },
    transitionBuilder: (context, anim1, anim2, child) {
      final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;

      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(
          opacity: anim1.value,
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: const EdgeInsets.only(bottom: 10),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            backgroundColor: Color.fromARGB(255, 99, 99, 99).withOpacity(0.3),
            content: Consumer<RatingProvider>(builder: (context, value, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 30,
                height: 40,
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.center,
                      iconSize: 35,
                      onPressed: () async {
                        bool result = await provider.setThumbsUp(content.id!);
                        if (result) {
                          handleCallback(Rate.up);
                        }
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        isThumbUp == null || !isThumbUp
                            ? Icons.thumb_up_outlined
                            : Icons.thumb_up_alt,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.center,
                      iconSize: 35,
                      onPressed: () async {
                        bool result = await provider.setThumbsDown(content.id!);
                        if (result) {
                          handleCallback(Rate.down);
                        }
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        isThumbUp == null || isThumbUp
                            ? Icons.thumb_down_outlined
                            : Icons.thumb_down_alt,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      );
    },
  );
}

refreshLimitDialog({required BuildContext context}) {
  Future.delayed(
      const Duration(milliseconds: 1600), () => Navigator.of(context).pop());
  showGeneralDialog(
    barrierDismissible: false,
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return const SizedBox();
    },
    transitionBuilder: (context, anim1, anim2, child) {
      final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;

      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(
          opacity: anim1.value,
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            contentPadding:
                const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            actionsPadding: const EdgeInsets.only(bottom: 10),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            backgroundColor: Colors.white,
            content: AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              width: MediaQuery.of(context).size.width,
              height: 45,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      'Please Wait a few seconds...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: Colors.red,
                      strokeWidth: 2.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
