class HomePresenter {
  validate(String artist, {Function() callback}) {
    if (artist.isNotEmpty) {
      if (callback != null) callback();
    }
  }

  findLyrics(String artist, {Function() callback}) {}
}
