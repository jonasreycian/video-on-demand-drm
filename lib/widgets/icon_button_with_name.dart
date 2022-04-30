import 'package:aq_prime/widgets/subtext_card.dart';
import 'package:flutter/material.dart';

class AddWatchListButton extends StatelessWidget {
  const AddWatchListButton({
    required this.title,
    required this.isExisting,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final String title;
  final bool isExisting;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 65,
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            iconSize: 35,
            onPressed: onPressed,
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: isExisting
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.add_outlined,
                      color: Colors.white,
                    ),
            ),
          ),
          Subtext(text: title)
        ],
      ),
    );
  }
}

class IconButtonWithName extends StatelessWidget {
  IconButtonWithName({
    required this.title,
    required this.iconData,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData iconData;
  final void Function()? onPressed;
  final Duration duration = Duration(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 65,
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            iconSize: 35,
            onPressed: onPressed,
            icon: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          Subtext(text: title)
        ],
      ),
    );
  }
}
