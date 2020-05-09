import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  final String _url = "https://api.lyrics.ovh/v1/";

  Future<String> fetchLyrics(String artist, String songName) async {
    var response;
    try {
      response = await http.get(_url + artist + "/" + songName);
    } catch (Exception) {
      print('Network error');
      return null;
    }
    if (response == null) return null;
    Map<String, dynamic> responseJson;
    try {
      responseJson = json.decode(response.body);
    } catch (Exception) {
      return null;
    }
    if (responseJson == null &&
        responseJson.values != null &&
        responseJson.values.length != 0) {
      return null;
    }

    return responseJson.values.first.toString();
  }
}
