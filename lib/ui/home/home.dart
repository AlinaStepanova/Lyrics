import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lyrics/ui/home/home_presenter.dart';
import 'package:lyrics/ui/lyrics/lyrics.dart';
import 'package:lyrics/ui/widgets/main_button.dart';
import 'package:lyrics/ui/widgets/search_field.dart';
import 'package:lyrics/ui/widgets/search_item.dart';
import 'package:lyrics/utils/constants.dart';
import 'package:lyrics/utils/strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isLoading = false;
  var _isArtistValid = true;
  var _isSongValid = true;
  final _artistTextController = TextEditingController();
  final _songTextController = TextEditingController();
  GlobalKey<ScaffoldState> _key = GlobalKey();

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Constants.primaryColor,
      key: _key,
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
                  style: TextStyle(
                      fontSize: height * 0.07, color: Constants.textColor),
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
                        SearchField(Strings.artistHint, _checkArtistInput,
                            _artistTextController, _isArtistValid),
                      ),
                      SearchItem(
                        Strings.songTitle,
                        SearchField(Strings.songHint, _checkSongInput,
                            _songTextController, _isSongValid),
                      ),
                      MainButton(() => _findLyrics()),
                    ],
                  ),
                ),
              ),
              if (_isLoading)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height / 4,
                    padding: EdgeInsets.only(bottom: height * 0.1),
                    alignment: Alignment.bottomRight,
                    child: SpinKitChasingDots(
                      color: Theme.of(context).accentColor,
                      size: Constants.loadingBarSize,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  void _findLyrics() {
    _homePresenter.findLyrics(
      _artistTextController.text,
      _songTextController.text,
      onValidationResults: (bool isArtistValid, bool isSongNameValid) {
        _handleArtistValidationResult(isArtistValid);
        _handleSongValidationResult(isSongNameValid);
        if (isArtistValid && isSongNameValid) _setLoadingState(true);
      },
      onRequestError: () => _showErrorSnackBar(),
      onRequestSuccess: (String lyrics) {
        _setLoadingState(false);
        _openBottomSheet(lyrics);
      },
    );
  }

  void _checkArtistInput() {
    _homePresenter.validate(_artistTextController.text,
        onValidationResult: _handleArtistValidationResult);
  }

  void _checkSongInput() {
    _homePresenter.validate(_songTextController.text,
        onValidationResult: _handleSongValidationResult);
  }

  void _handleArtistValidationResult(bool isValid) {
    setState(() => _isArtistValid = isValid);
  }

  void _handleSongValidationResult(bool isValid) {
    setState(() => _isSongValid = isValid);
  }

  void _showErrorSnackBar() {
    _setLoadingState(false);
    _key.currentState.showSnackBar(
      SnackBar(
        content: Text(
          Strings.callErrorText,
          style: TextStyle(fontSize: Constants.progressBarFontSize),
        ),
        duration: Duration(milliseconds: Constants.snackBarDuration),
      ),
    );
  }

  void _setLoadingState(bool isLoading) {
    setState(() => _isLoading = isLoading);
  }

  void _openBottomSheet(String lyrics) {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Constants.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(Constants.bottomSheetBorderRadius),
              topRight:
                  const Radius.circular(Constants.bottomSheetBorderRadius),
            ),
          ),
          child: Lyrics(_artistTextController.text.trim().toLowerCase(),
              _songTextController.text.trim().toLowerCase(), lyrics),
        );
      },
    );
  }
}
