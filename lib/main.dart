import 'package:flutter/material.dart';
import 'package:flutter_app/OwnTarif.dart';
import 'Constructor.dart';
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
        '/Constructor/OwnTarif': (context) => OwnTarif(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}