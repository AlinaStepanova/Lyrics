import 'package:flutter/material.dart';

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
            color: Colors.black,
            fontStyle: (isItalic) ? FontStyle.italic : FontStyle.normal));
  }
}
