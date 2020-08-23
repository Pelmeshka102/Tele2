import 'package:flutter/material.dart';
import 'package:flutter_app/Components/ButtonWithText.dart';
import 'package:flutter_app/Components/TextAndIcon.dart';
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
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
            Lk(),
            HowGetIt(),
            ButtonWithText("Оформить заказ", 0xFF000000, 0xFFFFFFFF)
          ]),
        )));
  }
}

class HowGetIt extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HowGetItState();
  }

}
enum D{Dostavka,Samovivos}

class HowGetItState extends State<HowGetIt>{
  D _character = D.Dostavka;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: twoBlockInset,
      padding: mainInset,
      color: mainColor,
      child: Column(
        children: [
          Text("Способ получения",style: textStyle24,),
          ButtonWithTextAndIcon(Text("Выберите регион, город",style: textStyle18,),"assets/location.svg"),
          ListTile(
            title: Text('Доставка',style: textStyle24),
            leading: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Color(0xFFE8E8ED),
              ),
              child: Radio(
                activeColor: Colors.green,
                value: D.Dostavka,
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
            title: Text('Самовывоз',style: textStyle24),
            leading: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Color(0xFFE8E8ED),
              ),
              child: Radio(
                activeColor: Colors.green,
                value: D.Samovivos,
                groupValue: _character,
                onChanged: (value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
          Container(
              margin: mainInset,
              child: Text("Открыть карту",textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF8F9399),fontSize: 24,decoration: TextDecoration.underline),))
        ],
      ),
    );
  }

}

class ButtonWithTextAndIcon extends StatelessWidget {
  final Widget content;
  final String path;
  ButtonWithTextAndIcon(this.content,this.path);

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
    return Container(
      margin: twoBlockInset,
      padding: mainInset,
      color: mainColor,
      child: Column(
        children: [
          Text("Личные данные", style: textStyle16),
          ButtonWithTextAndIcon(PhoneNumber(),"assets/user.svg"),
          ButtonWithTextAndIcon(Text("Как к вам обращаться",style: textStyle18,),"assets/user.svg"),
        ],
      ),
    );
  }
}

class PhoneNumber extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PhoneNumberState();
  }
}

class PhoneNumberState extends State<PhoneNumber> {
  TextEditingController _controller;
  String _start = "+7(___) ___ - __ - __";
  String next = "+7(___) ___ - __ - __";

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = _start;
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 90 - 48 - 12 - (15),
        child: TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              if (text.length < _start.length) {
                next = text;
                print(text);
                _controller.text = text.replaceFirst("_", "");
                _controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: text.indexOf("_")));
              } else {
                _controller.text = next;
              }
            },
            onTap: () {
              _controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: next.indexOf("_")));
            },
            controller: _controller));
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
