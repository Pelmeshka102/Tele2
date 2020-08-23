import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/AppBarWithBody.dart';
import 'package:flutter_app/Components/ButtonWithText.dart';
import 'package:flutter_app/Components/ContainerPadMarg.dart';
import 'package:flutter_app/Components/TextAndIcon.dart';
import 'package:flutter_svg/svg.dart';
import 'ConstVariables.dart';

class OwnTariff extends StatelessWidget {
  List<ButtonAndBool> _social = [
    ButtonAndBool("assets/odnok.svg", "assets/unactive/odnok.svg"),
    ButtonAndBool("assets/facebook.svg", "assets/unactive/facebook.svg"),
    ButtonAndBool("assets/vk.svg", "assets/unactive/vk.svg"),
  ];
  List<ButtonAndBool> _messanger = [
    ButtonAndBool("assets/whatsapp.svg", "assets/unactive/whatsapp.svg"),
    ButtonAndBool("assets/viber.svg", "assets/unactive/viber.svg"),
  ];
  List<ButtonAndBool> _more = [
    ButtonAndBool("assets/teletv.svg", "assets/unactive/teletv.svg"),
    ButtonAndBool("assets/tamtam.svg", "assets/unactive/tamtam.svg"),
    ButtonAndBool("assets/yandexmaps.svg", "assets/unactive/yandexmaps.svg"),
    ButtonAndBool("assets/youtube.svg", "assets/unactive/youtube.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarWithBody(
        title: "Настрой под себя",
        path: "assets/help.svg",
        content: Column(children: [
          ContainerPadMarg(TextAndIcon("Tele 2 Россия", "assets/infinity.svg")),
          QuantityOfTariff(),
          WindowServices("Соцсети", _social),
          WindowServices("Мессенджеры", _messanger),
          WindowServices("Больше услуг", _more),
          Sms(),
          AlwaysFree(),
          Container(
              margin: EdgeInsets.only(bottom: 30),
              child: ButtonWithText("Купить за 720", BLACK, WHITE)),
        ]));
  }
}

class QuantityOfTariff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerPadMarg(Column(
      children: [
        FieldWithHelp(
          "Выбери нужное",
          align: TextAlign.start,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyDrum("ГБ"),
            MyDrum("Мин"),
            MyDrum("МБ/с"),
          ],
        ),
        Container(
          margin: twoBlockInset,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    "Пакет минут расходуется на городские номера",
                    style: TextStyle(color: Colors.white),
                  )),
              Text(
                "+ 60 ₽",
                style: textStyle16,
              ),
              SwitchButton()
            ],
          ),
        )
      ],
    ));
  }
}

class MyDrum extends StatelessWidget {
  final String text;

  MyDrum(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200,
          width: 30,
          child: CupertinoPicker(
            magnification: 1.0,
            looping: true,
            backgroundColor: mainColor,
            children:
            List<Text>.generate(100, (i) => Text("$i", style: textStyle16)),
            itemExtent: 50,
            onSelectedItemChanged: (value) => null,
          ),
        ),
        Text(text, style: textStyle16),
      ],
    );
  }
}

class SwitchButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SwitchButtonState();
  }
}

class SwitchButtonState extends State<SwitchButton> {
  bool is_switch;

  SwitchButtonState({this.is_switch = false});

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: is_switch,
      onChanged: (value) => {
        setState(() {
          is_switch = !is_switch;
        })
      },
    );
  }
}

class WindowServices extends StatelessWidget {
  final String field_name;
  final List<ButtonAndBool> _list;

  WindowServices(this.field_name, this._list);

  @override
  Widget build(BuildContext context) {
    return ContainerPadMarg(
      Column(
        children: [
          FieldWithHelp(field_name),
          ServicesButton(_list),
        ],
      ),
    );
  }
}

class FieldWithHelp extends StatelessWidget {
  final String field_name;
  final TextAlign align;

  FieldWithHelp(this.field_name, {this.align = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
              field_name,
              style: textStyle16,
              textAlign: align,
            )),
        SvgPicture.asset("assets/help.svg")
      ],
    );
  }
}

class ButtonAndBool {
  String srcact, srcunact;
  String price;
  bool is_press;
  int color;
  ButtonAndBool(this.srcact, this.srcunact,
      {this.is_press = false, this.color = 0xFF333333, this.price = "20 ₽"});
}

class ServicesButton extends StatefulWidget {
  final List<ButtonAndBool> _list;

  ServicesButton(this._list);
  @override
  State<StatefulWidget> createState() {
    return ServicesButtonState(_list);
  }
}

class ServicesButtonState extends State<ServicesButton> {
  final List<ButtonAndBool> _list;
  double size_svg = 30;

  ServicesButtonState(this._list);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _list.map((e) {
        return Container(
          margin: EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              setState(() {
                e.is_press = !e.is_press;
                e.is_press ? e.color = Colors.green.value : e.color = 0xFF333333;
              });
            },
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.all(5),
                    child: SvgPicture.asset(e.is_press ? e.srcact : e.srcunact,
                        width: size_svg, height: size_svg)),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(e.color),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(e.price),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class Sms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: twoBlockInset,
      padding: mainInset,
      color: mainColor,
      child: Column(
        children: [FieldWithHelp("SMS"), SmsPrice()],
      ),
    );
  }
}

class SmsPrice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SmsPriceState();
  }
}

class TextPrice {
  String text, price;

  TextPrice(this.text, this.price);
}

class SmsPriceState extends State<SmsPrice> {
  List<TextPrice> _list = [
    TextPrice("Без SMS", "0 ₽"),
    TextPrice("20 SMS", "+ 20 ₽"),
    TextPrice("100 SMS", "+ 70 ₽"),
    TextPrice("300 SMS", "+ 150 ₽"),
  ];

  String _character = "Без SMS";

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _list.map((e) {
          return Row(
            children: [
              Expanded(
                child: Container(child: Text(e.text, style: textStyle16)),
              ),
              Expanded(child: Text(e.price, style: textStyle16)),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Color(0xFFE8E8ED),
                ),
                child: Radio(
                  value: e.text,
                  groupValue: _character,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ],
          );
        }).toList());
  }
}

class AlwaysFree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerPadMarg(
      Column(
        children: [
          Align(
              alignment: Alignment.center,
              child: Text("Всегда бесплатно", style: textStyle18)),
          TextAndIcon("Делитесь гигабайтами", "assets/wifi.svg"),
          TextAndIcon("Поездки по России без доплат", "assets/train.svg"),
          TextAndIcon("Остатки не сгорают", "assets/exchange.svg"),
          TextAndIcon("Честные звонки внутри сети", "assets/call_empty.svg")
        ],
      ),
    );
  }
}
