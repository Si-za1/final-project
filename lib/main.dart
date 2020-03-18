
import 'package:flutter/material.dart';
import 'package:search/pages/categories.dart';
//Rimport 'package:search/pages/facts.dart';
import 'package:search/pages/home.dart';
import 'package:search/pages/loading.dart';
//import 'package:search/pages/quiz.dart';
//import 'package:search/pages/audio.dart';
import 'package:search/pages/settings.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  //home: Home(),
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/settings': (context) => Setting(),
    '/categories': (context) => Categories(),
    //'/facts': (context) => Facts(),
    //'/quiz': (context) => Quizpage(),
    //'/audio': (context) => ExampleApp(),
  },
  debugShowCheckedModeBanner: false,
));
