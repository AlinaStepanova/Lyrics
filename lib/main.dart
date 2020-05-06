import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyrics',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(accentColor: Colors.tealAccent, primaryColor: Colors.white),
      home: HomePage(),
    );
  }
}