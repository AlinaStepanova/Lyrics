import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.songName,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04,
                              color: Colors.black)),
                      Text("by " + widget.artist,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              color: Colors.black)),
                    ],
                  ),
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
                      widget.lyrics,
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
