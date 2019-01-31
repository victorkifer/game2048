import 'package:flutter/material.dart';

import 'mycolor.dart';

@immutable
class Tile extends StatelessWidget {
  final int number;
  final double width, height;

  Tile(this.number, this.width, this.height);

  int colorForNumber() {
    switch (number) {
      case 2:
        return 0xffeee4da;
      case 4:
        return 0xffede0c8;
      case 8:
        return 0xfff2b179;
      case 16:
        return 0xfff59563;
      case 32:
        return 0xfff67c5f;
      case 64:
        return 0xfff65e3b;
      case 128:
        return 0xffedcf72;
      case 256:
        return 0xffedcc61;
      case 512:
        return 0xffedc850;
      case 1024:
        return 0xffedc53f;
      case 2048:
        return 0xffedc22e;
      case 4096:
        return 0xffedc22e;
      case 8192:
        return 0xffedc22e;
      case 16384:
        return 0xffedc22e;
    }
    return 0xffcdc1b4;
  }

  String numberToString() {
    return number == 0 ? "" : "$number";
  }

  double fontSizeForNumber() {
    switch (numberToString().length) {
      case 1:
      case 2:
        return 40.0;
      case 3:
        return 30.0;
      case 4:
        return 24.0;
      case 5:
        return 16.0;
    }
    return 20.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          numberToString(),
          style: TextStyle(
            fontSize: fontSizeForNumber(),
            fontWeight: FontWeight.bold,
            color: Color(MyColor.fontColorTwoFour),
          ),
        ),
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(colorForNumber()),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
