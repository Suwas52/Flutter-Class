import 'package:day9/pages/about.dart';
import 'package:day9/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Home(),
      '/about' : (context) => About()
    },
  ));
}

