import 'package:flutter/material.dart';
import 'package:lyrics/strings.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.tealAccent,
          primaryColor: Colors.white,
          fontFamily: 'PlayfairDisplay'),
      home: HomePage(),
    );
  }
}
