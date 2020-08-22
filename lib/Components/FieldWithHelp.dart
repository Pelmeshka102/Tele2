import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../ConstVariables.dart';

class FieldWithHelp extends StatelessWidget {
  final String field_name;
  final TextAlign align;
  final String img;
  FieldWithHelp(this.field_name,{this.align=TextAlign.center,this.img="assets/help.svg"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(field_name, style: textStyle18,
          textAlign: align,)),
        SvgPicture.asset(img)
      ],
    );
  }

}