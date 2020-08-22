import 'package:flutter/material.dart';

class ButtonWithText extends StatelessWidget {
  final String text, path;
  final int text_color, back_color;

  ButtonWithText(this.text, this.text_color, this.back_color,
      {this.path = null});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 24),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: RaisedButton(
            color: Color(back_color),
            padding: EdgeInsets.only(top: 16, bottom: 16),
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(25.0),
            ),
            onPressed: () =>
                path != null ? Navigator.pushNamed(context, path) : null,
            //TODO :функция проверки входа и правильности данных
            child: Text(
              text,
              style: TextStyle(color: Color(text_color)),
            ),
          ),
        ),
      ]),
    );
  }
}
