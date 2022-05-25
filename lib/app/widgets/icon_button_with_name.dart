import 'package:aq_prime/app/providers/my_watch_list_provider.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import 'subtext_card.dart';

class AddWatchListButton extends StatelessWidget {
  const AddWatchListButton({
    required this.title,
    required this.onPressed,
    this.contentId,
    Key? key,
  }) : super(key: key);
  final String title;
  final int? contentId;
  final void Function()? onPressed;

  bool isInWatchList(List<Content> src, int? contentId) {
    if (contentId == null) return false;
    Content? content =
        src.firstWhereOrNull((element) => element.id == contentId);
    return content != null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyWatchListProvider>(
      builder: (context, value, child) {
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
                iconSize: 24,
                onPressed: onPressed,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: isInWatchList(value.data, contentId)
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
      },
    );
  }
}

class IconButtonWithName extends StatelessWidget {
  IconButtonWithName({
    required this.title,
    required this.iconData,
    required this.onPressed,
    this.size = const Size(64, 64),
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData iconData;
  final void Function()? onPressed;
  final Duration duration = Duration(milliseconds: 1000);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            iconSize: 24,
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
