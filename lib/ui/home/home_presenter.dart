import 'package:lyrics/data/api.dart';

class HomePresenter {
  final api = Api();
  var _songName = "";
  var _lyrics = "";
  var _artist = "";

  validate(String artist, {Function(bool) onValidationResult}) {
    bool isValid = _isTextValid(artist);
    onValidationResult(isValid);
  }

  findLyrics(String artist, String songName,
      {Function(bool, bool) onValidationResults,
      Function() onRequestError,
      Function(String) onRequestSuccess}) {
    if (_songName.isNotEmpty &&
        _songName == songName.trim() &&
        _artist.isNotEmpty &&
        _artist == artist.trim() &&
        _lyrics.isNotEmpty) {
      onRequestSuccess(_lyrics);
    } else {
      bool isArtistValid = _isTextValid(artist);
      bool isSongValid = _isTextValid(songName);
      onValidationResults(isArtistValid, isSongValid);
      if (isArtistValid && isSongValid) {
        _retrieveLyrics(artist, songName,
            onRequestError: onRequestError, onRequestSuccess: onRequestSuccess);
      }
    }
  }

  bool _isTextValid(String text) {
    var result = true;
    if (text == null ||
        (text != null && text.trim().isEmpty) ||
        (text != null && text.trim().length < 2)) {
      result = false;
    }
    return result;
  }

  Future<void> _retrieveLyrics(String artist, String songName,
      {Function() onRequestError, Function(String) onRequestSuccess}) async {
    final jsonLyrics = await api.fetchLyrics(artist, songName);
    if (jsonLyrics != null && jsonLyrics.isNotEmpty) {
      onRequestSuccess(jsonLyrics);
      _artist = artist.trim();
      _songName = songName.trim();
      _lyrics = jsonLyrics.trim();
    } else {
      onRequestError();
    }
  }
}
