import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lyrics/search_field.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isLoading = true;
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
            children: <Widget>[
              Container(
                height: height / 4,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * 0.1),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Lyrics",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: height * 0.07, color: Colors.black),
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
                      buildColumn(context, "Artist",
                          SearchField("Enter atrist", () {})),
                      buildColumn(context, "Song Title",
                          SearchField("Enter song title", () {})),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                              side:
                                  BorderSide(color: Colors.black, width: 0.8)),
                          onPressed: () {},
                          color: Colors.white,
                          textColor: Colors.black,
                          child: Text("Find Lyrics",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.05)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_isLoading)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height / 4,
                    alignment: Alignment.bottomRight,
                    child: SpinKitChasingDots(
                      color: Theme.of(context).accentColor,
                      size: 50.0,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumn(
      BuildContext context, String title, SearchField textField) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: MediaQuery.of(context).size.width * 0.045)),
        textField,
      ],
    );
  }
}
