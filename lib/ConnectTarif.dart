import 'package:flutter/material.dart';
import 'package:flutter_app/Components/AppBarWithBody.dart';
import 'package:flutter_app/Components/ButtonWithText.dart';
import 'package:flutter_app/Components/FieldWithHelp.dart';
import 'ConstVariables.dart';

class ConnectTariff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarWithBody(
        title: "Подключиться к Tele2",
        path: "assets/help.svg",
        isScroll: false,
        content: Column(children: [
          Expanded(
            child: Column(
              children: [
                Tariff(),
                DoWithNumber(),
              ],
            ),
          ),
          Footer()
        ]));
  }
}

class Tariff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      margin: twoBlockInset,
      padding: mainInset,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldWithHelp(
            "Лайт",
            align: TextAlign.start,
            img: "assets/edit.svg",
          ),
          Row(
            children: [Info("40 ГБ"), Info("300 Мин"), Info("10 МБ/с")],
          ),
          Text(
            "600 ₽/мес",
            style: textStyle36,
          )
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  EdgeInsets margin = EdgeInsets.fromLTRB(0, 16, 16, 16);
  String text;

  Info(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(margin: margin, child: Text(text, style: textStyle24));
  }
}

class DoWithNumber extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DoWithNumberState();
  }
}

enum Number { set, get }

class DoWithNumberState extends State<DoWithNumber> {
  Number _character = Number.get;

  void callback(Number char) {
    setState(() {
      _character = char;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: twoBlockInset,
      color: mainColor,
      child: Column(
        children: [
          RadioButton(
              _character, 'Получить новый номер', Number.get, this.callback),
          RadioButton(
              _character, 'Перенести свой номер', Number.set, this.callback)
        ],
      ),
    );
  }
}

class RadioButton extends StatelessWidget {
  final Number _character;
  final String text;
  final Number value;
  final Function callback;

  RadioButton(this._character, this.text, this.value, this.callback);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.text, style: textStyle24),
      leading: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Color(0xFFE8E8ED),
        ),
        child: Radio(
          activeColor: Colors.green,
          value: value,
          groupValue: _character,
          onChanged: (val) {
            this.callback(val);
          },
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Я уже абонент",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              decoration: TextDecoration.underline,
            )),
        ButtonWithText("Продолжить", BLACK, WHITE,
            path: "/Constructor/ConnectTarif/Bin")
      ],
    );
  }
}
