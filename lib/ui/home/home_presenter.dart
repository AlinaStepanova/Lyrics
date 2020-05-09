import 'package:lyrics/data/api.dart';

class HomePresenter {
  bool _isTextValid(String text) {
    var result = true;
    if (text == null ||
        (text != null && text.trim().isEmpty) ||
        (text != null && text.trim().length < 2)) {
      result = false;
    }
    return result;
  }

  validate(String artist, {Function(bool) onValidationResult}) {
    bool isValid = _isTextValid(artist);
    onValidationResult(isValid);
  }

  findLyrics(String artist, String songName,
      {Function(bool) onArtistValidationResult,
      Function(bool) onSongNameValidationResult,
      Function(String) onRequestError,
      Function(String) onRequestSuccess}) {
    bool isArtistValid = _isTextValid(artist);
    bool isSongValid = _isTextValid(songName);
    onArtistValidationResult(isArtistValid);
    onSongNameValidationResult(isSongValid);
    if (isArtistValid && isSongValid) {
      _retrieveLyrics(artist, songName,
          onRequestError: onRequestError, onRequestSuccess: onRequestSuccess);
    }
  }

  Future<void> _retrieveLyrics(String artist, String songName,
      {Function(String) onRequestError,
      Function(String) onRequestSuccess}) async {
    final api = Api();
    final jsonLyrics = await api.fetchLyrics(artist, songName);
    if (jsonLyrics != null) {
      onRequestSuccess(jsonLyrics);
    } else {
      onRequestError("No lyrics found");
    }
  }
}
