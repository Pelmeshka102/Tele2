import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../ConstVariables.dart';

class AppBarWithBody extends StatelessWidget {
  String title;
  String path;
  Widget content;

  bool isScroll;

  AppBarWithBody({this.title, this.path, this.content, this.isScroll=true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(BLACK),
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: Text(title),
          centerTitle: true,
          actions: [
            path != null
                ? GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, "/Constructor/OwnTarif/Helper"),
                    child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: SvgPicture.asset(path)),
                  ):Text("")
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
            child: isScroll?SingleChildScrollView(
                scrollDirection: Axis.vertical, child: content):content));
  }
}
