import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String labelText;
  final Function onChange;
  const SearchBar({Key key, String this.labelText, Function this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusColor: Colors.blue,
        labelText: this.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      onChanged: this.onChange,
    );
  }
}
