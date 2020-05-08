import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrics/widgets/header_text.dart';

class Lyrics extends StatefulWidget {
  final String artist;
  final String songName;
  final String lyrics;

  const Lyrics(this.artist, this.songName, this.lyrics);

  @override
  _LyricsState createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.95,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: height * 0.2,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.05, right: width * 0.05, top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      HeaderText(widget.songName, height * 0.04, false),
                      HeaderText(widget.artist, height * 0.02, true),
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.tealAccent),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.08,
                      right: width * 0.08,
                      bottom: width * 0.02),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.lyrics,
                      style: TextStyle(fontSize: width * 0.045),
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
