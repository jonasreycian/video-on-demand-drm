import 'package:flutter/material.dart';

generalDialog({
  required BuildContext context,
  required String message,
  required bool isAutoClose,
  required bool isLoading,
  IconData? icon,
}) {
  if (isAutoClose) {
    Future.delayed(const Duration(milliseconds: 1500), () => Navigator.of(context).pop());
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
            contentPadding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
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
              height: 40,
              color: Colors.white,
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
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Colors.black,
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
