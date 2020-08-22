import 'package:flutter/material.dart';
import 'package:flutter_app/Components/ButtonWithText.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Components/ButtonTextCancel.dart';
import 'Components/ButtonWithTextWithoutFlex.dart';
import 'Components/ImageContainer.dart';
import 'ConstVariables.dart';

class Constructor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {//TODO ICON QUESTOIN - PODDERJKA
    return Scaffold(
        backgroundColor: Color(0xFF000000),
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: Text("Подключиться к Tele2"),
          centerTitle: true,
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10),
                child: SvgPicture.asset("assets/help.svg"))
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
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Region(),
                  CreateTariff(),
                  ListTarif(),
                  ImageContainer(),
                  Delivery(),
                ]))));
  }
}

class Region extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1E96C8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Ваш регион - Москва и \nМосковская область?",
                style: TextStyle(fontSize: 18),
              )), //TODO ПЕРЕНОС СЛОВА
          Container(
            child: Row(
              children: [
                Button(Icons.check, 0xFF1F2229, 0xFFFFFFFF),
                Button(Icons.close, 0xFF1F2229, 0XFF34CAFF)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final IconData icon;
  final int color, back_color;

  Button(this.icon, this.color, this.back_color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
      color: Color(back_color),
      child: Icon(icon, color: Color(color)),
    );
  }
}

class CreateTariff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      color: Color(0xFF000000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(16),
              child: Text("Тарифы",
                  style: TextStyle(fontSize: 36, color: Colors.white))),
          ButtonWithText("Создать свой тариф", 0xFF131313, 0xFFFFFFFF,path:"/Constructor/OwnTarif")
        ],
      ),
    );
  }
}

class ListTarif extends StatelessWidget {
  List<Tarif> _list = [
    Tarif(),
    Tarif(),
    Tarif(),
    Tarif(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children:
      _list.map((elem) => elem).toList()
    );
  }

}

class Tarif extends StatelessWidget {
  TextStyle style =TextStyle(fontSize: 24,color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 16,bottom: 16),
      color: mainColor,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWithTextWithoutFlex("Везде онлайн+",Colors.black.value,0xFFFFFFFF),
                Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: SvgPicture.asset("assets/fire.svg",))
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("600 мин.",style:style)),
          Align(
              alignment: Alignment.centerRight,
              child: Text("+ безлимит на Tele2 России",style:style)),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("40 ГБ",style:style)),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(" + ",style: style,),
                  SvgPicture.asset("assets/infinity.svg"),
                  SvgPicture.asset("assets/group.svg"),
                ],
              ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("600 ₽/мес.",style:TextStyle(color: Colors.white,fontSize: 48))),
          ),
          ButtonWithText("Купить", 0xFFFFFFFF, 0xFF131313,path: "/Constructor/ConnectTarif")
        ],
      ),
    );
  }
}

class Delivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 50),
      child: Column(
        children: [
          Text("Доставим SIM-карту бесплатно домой",
              style: TextStyle(color: Colors.white, fontSize: 36)),
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 16),
            child: Text(
                "Оформите заказ онлайн на сайте Tele2 и активируйте SIM-карту самостоятельно:",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          ListTile(
              leading: Icon(
                Icons.brightness_1,
                color: Colors.white,
              ),
              title: new Text(
                'быстро',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          ListTile(
              leading: Icon(
                Icons.brightness_1,
                color: Colors.white,
              ),
              title: new Text(
                'удобно',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          ListTile(
              leading: Icon(
                Icons.brightness_1,
                color: Colors.white,
              ),
              title: new Text(
                'качественно',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          ButtonWithText("Подробнее", 0xFFFFFFFF, 0xFF131313)
        ],
      ),
    );
  }
}