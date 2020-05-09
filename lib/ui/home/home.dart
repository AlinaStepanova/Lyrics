import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lyrics/strings.dart';
import 'package:lyrics/ui/home/home_presenter.dart';
import 'package:lyrics/ui/lyrics/lyrics.dart';
import 'package:lyrics/ui/widgets/main_button.dart';
import 'package:lyrics/ui/widgets/search_field.dart';
import 'package:lyrics/ui/widgets/search_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isLoading = false;
  final _inputKeyArtist = GlobalKey(debugLabel: 'inputTextArtist');
  final _inputKeySong = GlobalKey(debugLabel: 'inputTextSong');
  final _artistTextController = TextEditingController();
  final _songTextController = TextEditingController();

  @override
  void dispose() {
    _artistTextController?.dispose();
    _songTextController?.dispose();
    super.dispose();
  }

  final HomePresenter _homePresenter = HomePresenter();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            children: <Widget>[
              Container(
                height: height / 4,
                padding: EdgeInsets.only(bottom: width * 0.1),
                alignment: Alignment.bottomCenter,
                child: Text(
                  Strings.appName,
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
                      SearchItem(
                          Strings.artistTitle,
                          SearchField(Strings.artistHint, checkArtistInput,
                              _artistTextController)),
                      SearchItem(
                          Strings.songTitle,
                          SearchField(Strings.songHint, checkSongInput,
                              _songTextController)),
                      MainButton(() {
                        findLyrics();
                      }),
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

  void findLyrics() {}

  void checkArtistInput() {
    _homePresenter.validate(_artistTextController.text, callback: () {
      print(_artistTextController.text + " is valid");
    });
  }

  void checkSongInput() {
    _homePresenter.validate(_songTextController.text, callback: () {
      print(_songTextController.text + " is valid");
    });
  }

  void _openBottomSheet() {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        isDismissible: false,
        builder: (BuildContext bc) {
          return Wrap(children: <Widget>[
            Container(
              color: Color(0xFF737373),
              child: Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(25),
                        topRight: const Radius.circular(25))),
                child: Lyrics("Artist", "Song name", "Song lyrics"),
              ),
            )
          ]);
        });
  }
}
