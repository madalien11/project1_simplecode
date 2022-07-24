import 'package:flutter/cupertino.dart';

Widget starsBuilder(double count) {
  List<Widget> stars = [];

  while (count > 0.9) {
    count--;
    stars.add(
      const Icon(
        CupertinoIcons.star_fill,
        size: 16,
        color: CupertinoColors.systemYellow,
      ),
    );
    if (0.5 <= count && count < 1.0) {
      stars.add(
        const Icon(
          CupertinoIcons.star_lefthalf_fill,
          size: 16,
          color: CupertinoColors.systemYellow,
        ),
      );
      break;
    }
  }

  while (stars.length != 5) {
    stars.add(
      const Icon(
        CupertinoIcons.star,
        size: 16,
        color: CupertinoColors.systemYellow,
      ),
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: stars,
  );
}
