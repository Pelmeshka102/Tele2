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
          Text(
            "600 ₽/мес",
            style: TextStyle(fontSize: 32, color: Colors.white),
          )
        ],
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: twoBlockInset,
      color: mainColor,
      child: Column(
        children: [
          ListTile(
            title: Text('Получить новый номер', style: TarifStyle),
            leading: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Color(0xFFE8E8ED),
              ),
              child: Radio(
                activeColor: Colors.green,
                value: Number.get,
                groupValue: _character,
                onChanged: (value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Перенести свой номер',
              style: TarifStyle,
            ),
            leading: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Color(0xFFE8E8ED),
              ),
              child: Radio(
                activeColor: Colors.green,
                value: Number.set,
                groupValue: _character,
                onChanged: (value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ],
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
        ButtonWithText("Продолжить", 0xFF000000, 0xFFFFFFFF,
            path: "/Constructor/ConnectTarif/Bin")
      ],
    );
  }
}
