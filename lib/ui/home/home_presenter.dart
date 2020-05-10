import 'package:lyrics/data/api.dart';

class HomePresenter {
  final api = Api();

  validate(String artist, {Function(bool) onValidationResult}) {
    bool isValid = _isTextValid(artist);
    onValidationResult(isValid);
  }

  findLyrics(String artist, String songName,
      {Function(bool, bool) onValidationResults,
      Function() onRequestError,
      Function(String) onRequestSuccess}) {
    bool isArtistValid = _isTextValid(artist);
    bool isSongValid = _isTextValid(songName);
    onValidationResults(isArtistValid, isSongValid);
    if (isArtistValid && isSongValid) {
      _retrieveLyrics(artist, songName,
          onRequestError: onRequestError, onRequestSuccess: onRequestSuccess);
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
    if (jsonLyrics != null) {
      onRequestSuccess(jsonLyrics);
    } else {
      onRequestError();
    }
  }
}
