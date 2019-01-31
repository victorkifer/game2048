import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '2048',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Primary',
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
