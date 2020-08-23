import 'package:flutter/material.dart';
import 'package:flutter_app/Components/AppBarWithBody.dart';
import 'package:flutter_app/Components/ButtonWithText.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Components/ImageContainer.dart';
import 'ConstVariables.dart';

class Constructor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarWithBody(
        title: "Подключиться к Tele2",
        path: "assets/help.svg",
        content: Column(children: [
          Region(),
          CreateTariff(),
          ListTarif(),
          ImageContainer(),
          Delivery(),
        ]));
  }
}

class Region extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(REGION),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 1.8,
              padding: EdgeInsets.all(10),
              child: Text(
                "Ваш регион - Москва и Московская область?",
                style: TextStyle(fontSize: 18),
              )),
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
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
      color: Color(back_color),
      child: Icon(icon, color: Color(color)),
    );
  }
}

class CreateTariff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Color(BLACK),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: mainInset, child: Text("Тарифы", style: textStyle36)),
          ButtonWithText("Создать свой тариф", MAINCOLOR, WHITE,
              path: "/Constructor/OwnTarif")
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
    return Column(children: _list.map((elem) => elem).toList());
  }
}

class Tarif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: mainInset,
      margin: twoBlockInset,
      color: mainColor,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWithText(
                    "Везде онлайн+", BLACK, WHITE, flex: 0,
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                  margin: EdgeInsets.all(0),),
                Container(
                    margin: sideInset,
                    child: SvgPicture.asset(
                      "assets/fire.svg",
                    ))
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("600 мин.", style: textStyle24)),
          Align(
              alignment: Alignment.centerRight,
              child: Text("+ безлимит на Tele2 России", style: textStyle24)),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("40 ГБ", style: textStyle24)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  " + ",
                  style: textStyle24,
                ),
                SvgPicture.asset("assets/infinity.svg"),
                SvgPicture.asset("assets/group.svg"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("600 ₽/мес.",
                    style: textStyle48)),
          ),
          ButtonWithText("Купить", WHITE, MAINCOLOR,
              path: "/Constructor/ConnectTarif")
        ],
      ),
    );
  }
} //TODO не редачил

class Delivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: sideInset,
      child: Column(
        children: [
          Text("Доставим SIM-карту бесплатно домой",
              style:textStyle36),
          Container(
            margin: twoBlockInset,
            child: Text(
                "Оформите заказ онлайн на сайте Tele2 и активируйте SIM-карту самостоятельно:",
                textAlign: TextAlign.left,
                style: textStyle18),
          ),
          DotsInList(text: 'быстро'),
          DotsInList(text: 'удобно'),
          DotsInList(text: 'качественно'),
          ButtonWithText("Подробнее", WHITE, MAINCOLOR)
        ],
      ),
    );
  }
}

class DotsInList extends StatelessWidget {
  final String text;

  DotsInList({this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          Icons.brightness_1,
          color: Colors.white,
        ),
        title: new Text(
          text,
          style: textStyle18,
        ));
  }
}
