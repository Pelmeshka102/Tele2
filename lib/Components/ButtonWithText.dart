import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWithText extends StatelessWidget {
  final String text, path;
  final int text_color, back_color;
  final double radius;
  final double font_size;
  final TextAlign textAlign;
  final flex;
  EdgeInsets padding;
  EdgeInsets margin;

  ButtonWithText(this.text, this.text_color, this.back_color,
      {this.path = null,
      this.radius = 25,
      this.font_size = 16,
      this.textAlign = TextAlign.center,
      this.flex = 1,
      this.padding = const EdgeInsets.only(top: 16, bottom: 16),
      this.margin = const EdgeInsets.only(top: 8, bottom: 24)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(children: [
        Expanded(
          flex: flex,
          child: RaisedButton(
            color: Color(back_color),
            padding: padding,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(radius),
            ),
            onPressed: () =>
                path != null ? Navigator.pushNamed(context, path) : null,
            child: Text(
              text,
              textAlign: textAlign,
              style: TextStyle(color: Color(text_color), fontSize: font_size),
            ),
          ),
        ),
      ]),
    );
  }
}
