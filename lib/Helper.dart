import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Components/ButtonTextCancel.dart';
import 'ConstVariables.dart';

class Helper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF000000),
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: Text("Помощь и поддержка"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(child: Column(children: [Help()])));
  }
}

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: Center(
        child: Column(
          children: [
            ButtonTextCancel(
                "Более 200 статей и ответов на популярные вопросы"),
            ButtonTextCancel("Как войти в личный кабинет"),
            ButtonTextCancel("Забота об абонентах во время пандемии"),
            ButtonTextCancel("Как настроить интернет"),
            ButtonTextCancel("Помощь абонентам"),
          ],
        ),
      ),
    );
  }
}
