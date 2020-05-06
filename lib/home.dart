import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: height / 5,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Lyrics",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: width * 0.1, color: Colors.black),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: height / 2,
                  padding:
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextField(),
                      TextField(),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                              side: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          onPressed: () {},
                          color: Theme.of(context).accentColor,
                          textColor: Colors.white,
                          child: Text("Find Lyrics",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.045)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}