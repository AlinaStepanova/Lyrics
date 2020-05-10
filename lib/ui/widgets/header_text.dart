import 'package:flutter/material.dart';
import 'package:lyrics/utils/constants.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double height;
  final bool isItalic;

  const HeaderText(this.text, this.height, this.isItalic);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
            fontSize: height,
            color: Constants.textColor,
            fontStyle: (isItalic) ? FontStyle.italic : FontStyle.normal));
  }
}
