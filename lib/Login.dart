import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Components/ButtonWithText.dart';
import 'ConstVariables.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.all(45),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset("assets/mask.svg"),
              Container(
                  margin: EdgeInsets.only(top: 56),
                  child: Text(
                    "Добро пожаловать в Tele2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  )),
              LoginInputData()
            ]),
          ),
        )));
  }
}

class LoginInputData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 108),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 130),
            child: Text("Номер телефона:",
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
          Container(
              margin: EdgeInsets.only(top: 8),
              child: ButtonWithTextAndIcon(
                  PhoneNumber(), "assets/call_empty.svg")),
          ButtonWithText("Вход", 0XFFFFFFFF, 0X00000000),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/Constructor"),
            child: ButtonWithTextAndIcon(
                Text("Хочу стать абонентом", style: textStyle16),
                "assets/simcard.svg"),
          ),
        ],
      ),
    );
  }
}

class ButtonWithTextAndIcon extends StatelessWidget {
  final Widget content;
  final String image;

  ButtonWithTextAndIcon(this.content, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 24),
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: Colors.white, width: 1)),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(right: 12),
                child: SvgPicture.asset(image)),
            content
          ],
        ));
  }
}

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
