import 'package:code/configs/palette.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String blackPart;
  final String coloredPart;
  const Header({Key key, this.blackPart, this.coloredPart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          blackPart,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
            color: Palette.fontDark,
          ),
        ),
        Text(
          coloredPart,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
            color: Palette.accent,
          ),
        ),
      ],
    );
  }
}
