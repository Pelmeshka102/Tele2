import 'package:flutter/material.dart';
import 'package:flutter_app/Components/AppBarWithBody.dart';
import 'Components/ButtonTextCancel.dart';
import 'ConstVariables.dart';

class Helper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarWithBody(title: "Помощь и поддержка", content: Help());
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
