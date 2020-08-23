import 'package:flutter/material.dart';
import 'package:flutter_app/ConnectTarif.dart';
import 'package:flutter_app/OwnTarif.dart';
import 'Bin.dart';
import 'Constructor.dart';
import 'Helper.dart';
import 'Login.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => Login(),
        '/Constructor': (context) => Constructor(),
        '/Constructor/ConnectTarif': (context) => ConnectTariff(),
        '/Constructor/ConnectTarif/Bin': (context) => Bin(),
        '/Constructor/OwnTarif': (context) => OwnTarif(),
        '/Constructor/OwnTarif/Helper': (context) => Helper(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}