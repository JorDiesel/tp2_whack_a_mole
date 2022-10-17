import 'package:flutter/material.dart';
import 'package:tp1_whack_a_mole/background.dart';
import 'package:tp1_whack_a_mole/scoreValidator.dart';
import 'menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Background(classeActive: Menu())
      );
  }
}

