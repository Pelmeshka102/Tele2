import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF131313),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.all(45),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset("assets/Mask.png"),
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
              child: ButtonWithTextAndIcon(PhoneNumber(), "assets/call.png")),
          ButtonWithText(),
          ButtonWithTextAndIcon(
              Text("Хочу стать абонентом",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              "assets/simcard.png"),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 24),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: RaisedButton(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, "/profile", (route) => false),
            //TODO :функция проверки входа и правильности данных
            child: Text("Вход"),
          ),
        ),
      ]),
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
            color: Color(0xFF131313),
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: Colors.white, width: 1)),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(right: 12), child: Image.asset(image)),
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

  void initState() {
    super.initState();
    _controller = TextEditingController();
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
              _controller.text = _start;
            },
            controller: _controller));
  }
}
