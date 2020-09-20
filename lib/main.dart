import 'package:NewsApp308/drawer.dart';
import 'package:NewsApp308/home.dart';
import 'package:flutter/material.dart';
import 'package:NewsApp308/home.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dark = ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.white,
      textSelectionColor: Colors.white70);
  var bright = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      accentColor: Colors.black,
      textSelectionColor: Colors.black54,
      backgroundColor: Colors.white);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: dark,
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      theme: bright,
      home: Home(),
    );
  }
}
