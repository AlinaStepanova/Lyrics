import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lyrics extends StatefulWidget {
  @override
  _LyricsState createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Lake of fire",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            color: Colors.black)),
                    Text("by " + "Nirvana",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            color: Colors.black)),
                  ],
                ),
              ),
              Divider(color: Colors.tealAccent),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08,
                      right: MediaQuery.of(context).size.width * 0.08,
                      bottom: MediaQuery.of(context).size.width * 0.02),
                  child: SingleChildScrollView(
                    child: Text(
                      "Where do bad folks go when they die?\r\n"
                      "They don't go to heaven where the angels fly\r\n"
                      "They go to the lake of fire and fry\r\n\n"
                      "Won't see them again 'till the fourth of July",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
