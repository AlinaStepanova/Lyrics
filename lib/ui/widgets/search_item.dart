import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'search_field.dart';

class SearchItem extends StatelessWidget {
  final String title;
  final SearchField textField;

  const SearchItem(this.title, this.textField);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            style: TextStyle(
                color: Colors.black87,
                fontStyle: FontStyle.italic,
                fontSize: MediaQuery.of(context).size.width * 0.045)),
        textField,
      ],
    );
  }
}
