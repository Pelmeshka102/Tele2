import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/ButtonWithText.dart';
import 'package:flutter_app/Components/TextAndIcon.dart';
import 'package:flutter_svg/svg.dart';

import 'ConstVariables.dart';


class OwnTarif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF000000),
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: Text("Настрой под себя"),
          centerTitle: true,actions: [
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, "/Constructor/OwnTarif/Helper"),
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
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Container(
                      padding: mainInset,
                      margin: twoBlockInset,
                      color: mainColor,
                      child:
                          TextAndIcon("Tele 2 Россия", "assets/infinity.svg")),
                  QuantityOfTarif(),
                  WindowServices("Соцсети"),
                  WindowServices("Мессенджеры"),
                  WindowServices("Больше услуг"),
                  Sms(),
                  AlwaysFree(),
                  Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: ButtonWithText("Купить за 720",0xFF000000,0xFFFFFFFF)),
                ]))));
  }
}
class NameTarif extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      child: Row(
        children: [
          SvgPicture.asset("assets/infinity"),
          Text("Tele 2 Россия",style: textStyle16)
        ],
      ),
    );
  }

}
class QuantityOfTarif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
        margin: twoBlockInset,
        padding: mainInset,
        child:
        Column(
          children: [
            FieldWithHelp("Выбери нужное",align: TextAlign.start,),
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2,
                      child: Text("Пакет минут расходуется на городские номера",
                        style: TextStyle(color: Colors.white),)),
                  Text("+ 60 ₽", style: TextStyle(color: Colors.white)),
                  SwitchButton()
                ],
              ),
            )
          ],
        )
    );
  }
}
class MyDrum extends StatelessWidget{
  String text;
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
            children: List<Text>.generate(100,
                    (i)=>Text("$i",style: textStyle16)),
            itemExtent: 50,
          ),
        ),Text(text,style:textStyle16),

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
  bool is_switch = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: is_switch,
      onChanged: (value) =>
      {
        setState(() {
          is_switch = !is_switch;
        })
      },
    );
  }

}

class WindowServices extends StatelessWidget {
  final String field_name;

  WindowServices(this.field_name);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: twoBlockInset,
      color: mainColor,
      padding: mainInset,
      child: Column(
        children: [
          FieldWithHelp(field_name),
          ServicesButton(),
        ],
      ),
    );
  }
}

class FieldWithHelp extends StatelessWidget {
  final String field_name;
  final TextAlign align;
  FieldWithHelp(this.field_name,{this.align=TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(field_name, style: textStyle16,
          textAlign: align,)),
        SvgPicture.asset("assets/help.svg")
      ],
    );
  }

}

class ButtonAndBool {
  String src;
  String price;
  bool is_press;
  int color;

  ButtonAndBool(this.src,
      {this.is_press = false, this.color = 0xFFFF44FF, this.price = "20 ₽"});
}

class ServicesButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ServicesButtonState();
  }
}

class ServicesButtonState extends State<ServicesButton> {
  List<ButtonAndBool> _list = [
    ButtonAndBool("assets/help.svg"),
    ButtonAndBool("assets/help.svg"),
    ButtonAndBool("assets/help.svg"),
  ];
  double size_svg = 30;

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
                e.is_press ? e.color = Colors.grey.value : e.color = 0xFFFF44FF;
              });
            },
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.all(5),
                    child: SvgPicture.asset(e.src, color: Color(e.color),
                        width: size_svg,
                        height: size_svg)),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(e.color),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
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
        children: [
          FieldWithHelp("SMS"),
          SmsPrice()
        ],
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
                child: Container(
                    child: Text(e.text,
                        style: textStyle16)),
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
        }).toList()

    );
  }

}

class AlwaysFree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: twoBlockInset,
      padding: mainInset,
      color: mainColor,
      child: Column(
        children: [
          Align(
              alignment: Alignment.center,
              child: Text("Всегда бесплатно",
                style: textStyle18)),
          TextAndIcon("Делитесь гигабайтами", "assets/wifi.svg"),
          TextAndIcon("Поездки по России без доплат", "assets/train.svg"),
          TextAndIcon("Остатки не сгорают", "assets/exchange.svg"),
          TextAndIcon("Честные звонки внутри сети", "assets/call_empty.svg")
        ],
      ),
    );
  }

}