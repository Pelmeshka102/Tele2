import 'package:flutter/material.dart';

import '../ConstVariables.dart';

class ContainerPadMarg extends StatelessWidget {
  final Widget content;
  final int color;
  ContainerPadMarg(this.content,{this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: twoBlockInset,
        color: mainColor,
        padding: mainInset,
        child: content);
  }
}
