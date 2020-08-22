import 'package:flutter/material.dart';
import 'package:flutter_app/Components/ButtonWithText.dart';
import 'package:flutter_svg/svg.dart';

import 'Components/FieldWithHelp.dart';
import 'ConstVariables.dart';

class Bin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF000000),
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: Text("Подключиться к Tele2"),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, "/Constructor/OwnTarif/Helper"),
              child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset("assets/help.svg")),
            )
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
            child: Column(children: [
              Container(
                margin: twoBlockInset,
                padding: mainInset,
                child: Text(
                  "1 комплект в корзине",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.start,
                ),
              ),
              AboutSim(),
              Promo(),
              AllSum(),

              ButtonWithText("Оформить заказ",  0xFF000000 ,0xFFFFFFFF)
            ])));
  }
}
class HowGetCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
  }

}
class AboutSim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      padding: mainInset,
      margin: twoBlockInset,
      child: Column(
        children: [
          FieldWithHelp(
            "SIM",
            align: TextAlign.start,
            img: "assets/cross.svg",
          ),
          FieldWithHelp(
            "Лайт",
            align: TextAlign.start,
            img: "assets/edit.svg",
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 16, 16),
                  child: Text("40 ГБ", style: TarifStyle)),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 16, 16),
                  child: Text("300 Мин", style: TarifStyle)),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 16, 16),
                  child: Text("10 МБ/с", style: TarifStyle)),
            ],
          ),
          FieldWithHelp(
            "+7 977 742-50-74",
            align: TextAlign.start,
            img: "assets/edit.svg",
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Стоимость подключения",
                      style: textStyle16,
                    ),
                    Text(
                      "Сумма будет внесена на счёт",
                      style: TextStyle(color: Color(0xFF8F9399), fontSize: 16),
                    ),
                  ],
                ),
              ),
              Text(
                "600 ₽",
                style: textStyle24,
              )
            ],
          )
        ],
      ),
    );
  }
}

class Promo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      margin: twoBlockInset,
      padding: mainInset,
      child: Column(
        children: [
          Text("Промокод", style: textStyle16),
          ButtonWithText(
            "dsoiukhuy3582909hbhg", 0xFFFFFFFF, 0xFF000000, radius: 5,),
          ButtonWithText("Применить промокод", 0xFF000000, 0xFFFFFFFF)
        ],
      ),
    );
  }
}

class AllSum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      padding: mainInset,
      margin: twoBlockInset,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Всего", style: TextStyle(fontSize: 36, color: Colors.white),),
          Text("600 ₽", style: textStyle24),
        ],
      ),
    );
  }

}