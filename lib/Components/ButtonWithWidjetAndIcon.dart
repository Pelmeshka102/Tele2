import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../ConstVariables.dart';

class ButtonWithWidjetAndIcon extends StatelessWidget {
  final Widget content;
  final String image;

  ButtonWithWidjetAndIcon(this.content, this.image);

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