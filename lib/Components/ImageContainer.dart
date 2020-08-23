import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      width: MediaQuery.of(context).size.width,
      child: Image.asset("assets/man.png")
    );
  }

}