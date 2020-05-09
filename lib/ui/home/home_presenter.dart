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
      Function() onRequestError,
      Function() onRequestSuccess}) {
    bool isArtistValid = _isTextValid(artist);
    bool isSongValid = _isTextValid(songName);
    onArtistValidationResult(isArtistValid);
    onSongNameValidationResult(isSongValid);
    if (isArtistValid && isSongValid) {
      // start request;
    }
  }
}
