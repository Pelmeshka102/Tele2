import 'package:flutter/material.dart';

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
        '/C': (context) => Login(),
        '/': (context) => Constructor(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}