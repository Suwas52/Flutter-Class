import 'package:crud_app/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("practise"),
      ),
      body: Home(),
    ),
  ));
}
