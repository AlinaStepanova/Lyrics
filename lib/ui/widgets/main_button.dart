import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../strings.dart';

class MainButton extends StatelessWidget {
  final Function call;

  const MainButton(this.call);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ButtonTheme(
      minWidth: width,
      height: width * 0.15,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.black, width: 0.8)),
        onPressed: call,
        color: Colors.white,
        textColor: Colors.black,
        child:
            Text(Strings.buttonText, style: TextStyle(fontSize: width * 0.05)),
      ),
    );
  }
}
