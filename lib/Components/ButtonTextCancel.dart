import 'package:flutter/material.dart';

class ButtonTextCancel extends StatelessWidget {
  final String text;

  ButtonTextCancel(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 4,bottom: 4),
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: (MediaQuery.of(context).size.width-20)/1.5,
            child: Text(text,style: TextStyle(fontSize: 18),)),
        Icon(
          Icons.navigate_next,
          color: Color(0xFF1F2229),
        )
      ]),
    );
  }
}
