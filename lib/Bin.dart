import 'package:flutter/material.dart';
import 'package:flutter_app/Components/AppBarWithBody.dart';
import 'package:flutter_app/Components/ButtonWithText.dart';
import 'package:flutter_app/Components/ContainerPadMarg.dart';
import 'package:flutter_svg/svg.dart';
import 'Components/FieldWithHelp.dart';
import 'Components/PhoneNumber.dart';
import 'ConstVariables.dart';

class Bin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarWithBody(
      title: "Подключиться к Tele2",
      path: "assets/help.svg",
      content: Column(children: [
        Container(
          margin: twoBlockInset,
          padding: mainInset,
          child: Text(
            "1 комплект в корзине",
            style: textStyle24,
            textAlign: TextAlign.start,
          ),
        ),
        AboutSim(),
        Promo(),
        AllSum(),
        Lk(),
        HowGetIt(),
        ButtonWithText("Оформить заказ", BLACK, WHITE)
      ]),
    );
  }
}

class HowGetIt extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HowGetItState();
  }
}

enum D { Dostavka, Samovivos }

class HowGetItState extends State<HowGetIt> {
  D _character = D.Dostavka;
  void callback(D d) {
    setState(() {
      _character = d;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ContainerPadMarg(
      Column(
        children: [
          Text(
            "Способ получения",
            style: textStyle24,
          ),
          ButtonWithTextAndIcon(
              Text(
                "Выберите регион, город",
                style: textStyle18,
              ),
              "assets/location.svg"),
          RadioButton(_character,'Доставка',D.Dostavka,this.callback),
          RadioButton(_character,'Самовывоз',D.Samovivos,this.callback),
          Container(
              margin: mainInset,
              child: Text(
                "Открыть карту",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF8F9399),
                    fontSize: 24,
                    decoration: TextDecoration.underline),
              ))
        ],
      ),
    );
  }
}
class RadioButton extends StatelessWidget{
  D _character;
  D value;
  final String text;
  final Function callback;
  RadioButton(this._character,this.text,this.value,this.callback);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text, style: textStyle24),
      leading: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Color(0xFFE8E8ED),
        ),
        child: Radio(
          activeColor: Colors.green,
          value: value,
          groupValue: _character,
          onChanged: (value) =>callback(value)
        ),
      ),
    );
  }

}
class ButtonWithTextAndIcon extends StatelessWidget {
  final Widget content;
  final String path;

  ButtonWithTextAndIcon(this.content, this.path);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: mainInset,
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white, width: 1)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 12),
              child: SvgPicture.asset(path),
            ),
            content
          ],
        ));
  }
}

class Lk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerPadMarg(
      Column(
        children: [
          Text("Личные данные", style: textStyle16),
          Padding(
            padding: twoBlockInset,
            child: ButtonWithTextAndIcon(PhoneNumber(), "assets/user.svg"),
          ),
          Padding(
            padding: twoBlockInset,
            child: ButtonWithTextAndIcon(
                Text(
                  "Как к вам обращаться",
                  style: textStyle18,
                ),
                "assets/user.svg"),
          ),
        ],
      ),
    );
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
                  child: Text("40 ГБ", style: textStyle24)),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 16, 16),
                  child: Text("300 Мин", style: textStyle24)),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 16, 16),
                  child: Text("10 МБ/с", style: textStyle24)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Промокод", style: textStyle16),
          ButtonWithText(
            "dsoiukhuy3582909hbhg",
            0xFFFFFFFF,
            0xFF000000,
            radius: 5,
            textAlign: TextAlign.start,
          ),
          ButtonWithText(
            "Применить промокод",
            0xFF000000,
            0xFFFFFFFF,
            radius: 10,
            font_size: 24,
          )
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
          Text(
            "Всего",
            style: TextStyle(fontSize: 36, color: Colors.white),
          ),
          Text("600 ₽", style: textStyle24),
        ],
      ),
    );
  }
}
