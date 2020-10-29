import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrics/utils/constants.dart';

import '../../utils/strings.dart';

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
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.borderRadius),
          side: BorderSide(color: Constants.textColor, width: 0.8),
        ),
        onPressed: call,
        color: Constants.primaryColor,
        textColor: Constants.textColor,
        child: Text(
          Strings.buttonText,
          style: TextStyle(fontSize: width * 0.05),
        ),
      ),
    );
  }
}
