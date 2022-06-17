import 'package:flutter/material.dart';

class IcTxWidget extends StatelessWidget {
  IcTxWidget(
      {required this.iconData,
        required this.iconSize,
        required this.gapSize,
        required this.txt});

  final IconData iconData;
  final double iconSize;
  final double gapSize;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: iconSize,
        ),
        SizedBox(
          height: gapSize,
        ),
        Text(
          txt,
        ),
      ],
    );
  }
}