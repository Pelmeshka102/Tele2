import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextAndIcon extends StatelessWidget {
  final String text;
  final String image;

  TextAndIcon(this.text, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 12),
              child: SvgPicture.asset(image),
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ));
  }
}
