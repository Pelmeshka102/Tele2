import 'package:flutter/material.dart';

class ButtonWithTextWithoutFlex extends StatelessWidget {
  final String text;
  final int text_color,back_color;
  ButtonWithTextWithoutFlex(this.text,this.text_color,this.back_color);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      RaisedButton(
        color: Color(back_color),
        padding: EdgeInsets.only(top: 16, bottom: 16,left: 25,right: 25),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white,width: 1),
          borderRadius: BorderRadius.circular(25.0),
        ),
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context, "/profile", (route) => false),
        //TODO :функция проверки входа и правильности данных
        child: Text(text,style: TextStyle(color: Color(text_color),fontSize: 24)),
      ),
    ]);
  }
}
