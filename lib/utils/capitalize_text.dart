/// Pure Dart Optimized code to Capitalize each first letter of a word in a sentence.
/// 
String capitalize(String s) {
  if (s.runtimeType == String && s.length > 2) {
    if (s.contains(" ")) {
      List<String> capitalizeText = [];
      List<String> text = s.split(" ");
      for (String string in text) {
        capitalizeText.add(string[0].toUpperCase() + string.substring(1));
      }
      return capitalizeText.join(" ");
    } else {
      return s[0].toUpperCase() + s.substring(1);
    }
  } else {
    return s;
  }
}
