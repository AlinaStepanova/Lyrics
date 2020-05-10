import 'package:flutter/material.dart';
import 'package:lyrics/utils/strings.dart';

import 'ui/home/home.dart';
import 'utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Constants.accentColor,
          primaryColor: Constants.primaryColor,
          fontFamily: Constants.defaultFontFamily),
      home: HomePage(),
    );
  }
}
