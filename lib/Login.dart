import 'package:flutter/material.dart';
import 'package:flutter_app/Components/ButtonWithWidjetAndIcon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Components/ButtonWithText.dart';
import 'Components/PhoneNumber.dart';
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      ImageWithWelcomeText(
                          "Добро пожаловать в Tele2", "assets/mask.svg"),
                      LoginInputData()
                    ])))));
  }
}

class ImageWithWelcomeText extends StatelessWidget {
  final String _text;
  final String _path;

  ImageWithWelcomeText(this._text, this._path);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(_path),
      WelcomeText(_text),
    ]);
  }
}

class WelcomeText extends StatelessWidget {
  final String text;

  WelcomeText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 56),
        child: Text(text, style: textStyle24));
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
                style: textStyle16),
          ),
          Container(
              margin: EdgeInsets.only(top: 8),
              child: ButtonWithWidjetAndIcon(
                  PhoneNumber(), "assets/call_empty.svg")),
          ButtonWithText("Вход", BLACK, WHITE),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/Constructor"),
            child: ButtonWithWidjetAndIcon(
                Text("Хочу стать абонентом", style: textStyle16),
                "assets/simcard.svg"),
          ),
        ],
      ),
    );
  }
}
