import 'package:flutter/material.dart';

class PhoneNumber extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PhoneNumberState();
  }
}

class PhoneNumberState extends State<PhoneNumber> {
  TextEditingController _controller;
  String _start = "+7(___) ___ - __ - __";
  String next = "+7(___) ___ - __ - __";

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = _start;
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 90 - 48 - 12 - (15),
        child: TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              if (text.length < _start.length) {
                next = text;
                print(text);
                _controller.text = text.replaceFirst("_", "");
                _controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: text.indexOf("_")));
              } else {
                _controller.text = next;
              }
            },
            onTap: () {
              _controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: next.indexOf("_")));
            },
            controller: _controller));
  }
}
